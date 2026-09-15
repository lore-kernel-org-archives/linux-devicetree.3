Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368E47CC85
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465916; cv=none; b=VP/eGkuBIfkAo6B+aX/H1GhOy38QVQVzd6ER5+ffA1MXmJLoqACzSqMSxXSOENsAIoKDhNZuY8zMVoTlVajEbTbTGW+9jRKRtzbKECUfwVbjivhngxUi2SX+Gq8fKNAzumVtg+y+hjpvfSO2glTWYQpSooFwOkl9k5O8tk3UhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465916; c=relaxed/simple;
	bh=fsv5FuQjdenUC/MA7KEcDcRD5qJ+JKikKx3HzE58Udg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtxuzZXDfx22XnKq7UEBj3iAgiywczhJlzcuzJvwfwkPK70V/7vdgLmxjgIGeqIPo6cSxICbcG7/Ni5+nc5BrTsKuZMpY0YiX2DAHoAkFKxXVHH3nO4ti6LkWcnZzakx4P7JvpBWXjsm7cyPUozYATIzfCLb/GRtBk83BYFexFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI8gvr/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4WOQpur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI8gvr/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4WOQpur"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gv3x275491
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m1XFciMC/FLa8VakPPfRy3mt
	kacc3Afj+FPNQf0K3uE=; b=CI8gvr/1w5ZXZRm38i+8BGRL88LIfWTnN0MqNM8e
	L+61VU2lXgzj8J7GVB6+g5+zLW1gJxbmQWVmvYRDteXttBIHoLWOHVmlUEPu29/A
	Y+taWVgNqPwHl8KW6fcDSrUUgOl9FAWMfk0c92p00UWd5a+2cNHLE4wuvYP2H4H4
	hP9rm3BslPj98pVC4i8qek5qWxRbNGgYN+jU2NOGruhzl5l5jy6ZVPLnhn4mB4ep
	FH+QsCovJGjapiJnqpChffwKXZkdK7Ra6JN8IXFlzghDAbHIzKgRgFQ8pFGdpUj8
	J+7L+v4HBvMXUHLGlfCLD6vybnqAcIypHxGNtS69f0A1Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea14wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:51:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so814753385a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465911; x=1790070711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=J4WOQpurp+mf9x/5w5gLPAISGQKfi0n7igrYiAY7krP37VwafWB27g2h12CsRvwAxq
         3phoUbODRqKyo26AWKUS8v8HHFS9xQ1+1sYNtdIDKp1GF18Fg3uLPcx9hfwa3UyTlNJD
         gjbTabUfUNynoKFxDVHVUGs7m0Phc6F9xpG+Cq2JAXyLEb954z4PTaQKXaKNPJlcBQMv
         SPP4zew4maTuOmfUJkf/+OxNvPHbbpsOA/dAkY3dZahL+famxpHPfS/y6TESk5EQ59zI
         7UD9BlL5TlHL61aSpJHuHSqLfpF3HeunH7FI2UbLuhEvEPVC4ARIdqLR9HWIwlU5Tbb/
         CQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465911; x=1790070711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=BtrxL8qZxK4q84g19GAXPcyMlI/V+up8HRJg6UetT05u1QlhkYye9CMkOJadij4V1x
         DvuVoJgNTsAwjInNvSqKB5HMZWPoyVPX2Qgzg7eEgLEA48h5RgYo16uaQeSnbZ6s8XKb
         35Kr4Sp7AAIyjD+FROPmuoa7ZdI7dvnDhG63q71WgVGIabqO1if3C+04jU6zVBxUo8BJ
         mu83Z6hlBdbB4UuCb2tMlNJ96mCLYfCjq2JHg+QACZY7o7fsW7tieAt+FCaYHLhmzOER
         uOPaxY4otdngpvS9G7e3mj6xwZEYTEjPUcup39OU49BHIbtx+QSK92KoaK9d3giStwl5
         QZbA==
X-Forwarded-Encrypted: i=1; AKwUvBx9pcdk2BerPizBLp+pn5W7V+NS2Zq8wx6sCQS67T69VLZtJqXjG3M3nAy1snGDh2X5stMUA6sku1jx@vger.kernel.org
X-Gm-Message-State: AFuF++kP7a9CO8ynLYvRzFyp1TdA+8/Z+3kjjYhDcqDOWDk6NimAT/5G
	uWuf61621B1NlZLBBSR4mAFe50KI9+NHh572CoXzUT0xsGrypfv2Pd2ewNR8IDFRUrEH3puuUJQ
	lhkvOwTh/zXs7KV+KkAfjaoVOrkjEuQsH5EV2YHUiXzKLSu8o0J7PpGkL72rWfou8
X-Gm-Gg: AYBFou2b06epWqG6UpLXyt0vDSzUWEcOaeG8toWDBVJKLKTonuwHVsc2XS/hGe1dc8B
	VHbruz4azJmBn2MSiYjotGTj/xAWrZbMUcHSRMNcwpxZZ4egZS9YekAMazIsuHbnmKdFQNF/Gmv
	dNIW6Rage3S+LZgfQbBLUyyvcGd9QXuB/p+1Ol60EO2BOh0NADDHbwGSPPSpUSoXa6zXEBSDfNX
	iCQUgxLL3zSTQDYwtmCGG+h6/hyzWPBcQHMB2unMIy4x6Qrhgc4juK0ZqBEOx/f0PaCjtg8hCfd
	dA7IkOYEBzAiTeQ9RVNppUNBHIOz5TnlQvGgUFuLZ26yzSjTzgCWE5viy1ZEodDwZ0O5e048Gyx
	zs0CjIqngKYeyjx0=
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882785485a.12.1789465910682;
        Tue, 15 Sep 2026 02:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882757585a.12.1789465905439;
        Tue, 15 Sep 2026 02:51:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm32642467f8f.35.2026.09.15.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:51:44 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:51:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <nu5u3hr7erxzd5l5g4xnktdnnl2w43tjt75la4tkq4ddv5mfbx@npts3dwmx6wp>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NDCGqeCblic05GJOalcN0AVT7XEpBzHO
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa91539 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NDCGqeCblic05GJOalcN0AVT7XEpBzHO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfXyCDY/YntxEyM
 Cz55LfMH8I/7wIqRTONSsjycOF5/q3OpJu2riUSnzyptex8Ql9ma3CVnfpqAOPnN1bGn1cMH7DR
 BDYt7t6EBbWmAWGzIU3uIUmOaLTpCeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX0grV4BOp7z62
 j9YrkxVCHtMwOarGpsI8Uea4aUuzliKiMbajyU8AWt95l7FHE31MepHgsVm4IZwij2vXt3MWSSN
 H18ANdrt7651Ava0q6BUFiSDT1AoAFMQaMaQLunn/3fj3YtRENJIW/7ssm9Iaelh49x1ZQ/rYch
 VdGzpgPvo496+lLOBDau4D5/mUoB4e50kj8acyvVK63QL3VoZTABmW+tz6VocSUaj8/ReOw3blN
 +pRIZPHur9Xy1EfeclHt5x+doThZwqPL2Dz+7CD8jS470eM4+5yqL149HynP+JVZdTFPfnBXNmI
 NGwO7jgcUweQyf9mAeTI78xfvXGFL3rIMmKaJQxNJNR7gduwEtv8LN7dQlgRXWc6PvaTcufsZJ6
 aqPRu6wi7KDkA4kUlISXaPHjDkuTiGrCJsW29fd33Zu8PS9RV/x/0AUySeWRXDEVbbNe6YV3/Ya
 VNkeKnLd37WL30bTb7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141

On 26-09-15 10:11:11, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
