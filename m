Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1F3E51D3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371359; cv=none; b=YfotfEVZ0WqQtuRSxfCwD9qEKvaE9WWZJop+HP+wdvGE8Ph+Ie4WVvnIZCDu6q783DlWz03/FQ6t0Di6fyPg700v1m2oFhWr366grDoImqgqZkGoRy16X44wqDDDfmrsMYyPYoavTA1njTgUlFZIXAoCpEFSwygIaaL/Tc5FV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371359; c=relaxed/simple;
	bh=PCOVoo9qBYPHfalZRTlYMlOVlx9GrN2uo9QeEj/nyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOuel7b1grV/fF2ZtH4wdtEBOKbMaKzizGOE6WDQUMNN2Y1/JNhi/rfhp2FCdU2Z08/gYMuG0LHquXyd1mlyD/yTZ4YSzHMDaNtSTAuUjA2W/yHwCu2+WInts5pTlVY8hgVXf0NfMRWNC+yA4QXm3+9fI4OtnfFbvPes5E5xJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDeM9Wkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2zlkxvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDeM9Wkm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2zlkxvK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jdkn064858
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X0OiAYD97Wxb3yCfopmraxq2
	9lWmspdRXWzh4AfWM7g=; b=bDeM9WkmAXwRSHnvk7OVTjGGLRTnq+YGbfhMXtyZ
	3xtjMruju+riYpu6lsASmbLq5Hb7gbWy6UEGI8SwS6IlD4i6eouFv6m5MDcxf8Mi
	e3tOIq08VNKjycp9QZBy3ewbAAOJRGgNAiRcido2nhQBjLeceXF1YGW2+ePf56ML
	tsWVowPM65WnpdldVSpAyo0YE6yZTXJXI4prKkp+pwqyLr981vVwg8riVfTayFjE
	138wQz43flX+FOJga/IU08FUDG3D+CDAa9twSqunJE3Ufb3cQJzlpv2bAd0SdFe6
	wK2WTo8V/GNcnCvBA/ZIH82U/7XeK+zdqB/+tg2beLJOzg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104c2ce026so94596986d6.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371356; x=1789976156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0OiAYD97Wxb3yCfopmraxq29lWmspdRXWzh4AfWM7g=;
        b=R2zlkxvKszroZjAv7TpBy4xDqasLvUKngT6FWuy/nOPcYQcX7Ahq+hFeuxiZlzu/fY
         u8dwSnEjB3SDrdfKFJu9WH4xSt/dcax+sYwvbpZUKEc3tDm4FSoQGiIrKF5nrUS8DntF
         l9C/SZlQRTSvb/QZvyseO625AOQ3WVCwrW83yWhUvwKDFMqFOnHlliLL/fiUui+77+W3
         m6WLO/WPGEAzDk2WWqUW6lQKOh1xj4MUNyNe927MpZBhSiLu71x41JcDJc7U6lcEiY9G
         HQYGIkOQVb5jTHxv7yNMPt8wWipHUxJ5c3/X3pyUbfMjRSpi0wUwQVRyU5yT6PzdqEHC
         84Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371356; x=1789976156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0OiAYD97Wxb3yCfopmraxq29lWmspdRXWzh4AfWM7g=;
        b=dogH180nygfUQ2BWQc9RNBBvnAxuQ1U+w7FaYNH3T/g3kUOdHieKHspTjWPsXMFCy2
         h9sxXFChzZb++eNKpJ2FcyoW3sCHJjdh28ydGipaC44bm+FoRRk0wtoM7a+CcwTvPMfg
         wm3mqA5CIBz61oqdlY+6OIErjR6mxsj/9lqI0Rcezy554BapWqWJVROfTFpozDIYQCNO
         n3oOeLHOIt0N27PmjCPAvQDH2DnQyheOGQ9MNOkPoUuBfhhI8LdtvL/luMK2F+iv1gIW
         omImWRtA/wnIPHDswFuAPBKk37Ou1MpXMfu4FDW4h+3UlZCfUVwhc1K/yRjbWl2ZytHA
         +lqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeMHZ94iNjqlIDU8tGnc38JjIQ/zAtRFbXrMQStA9IwpuscEzs5qedv6r2eYlo/xn5TE5meJWamkIw@vger.kernel.org
X-Gm-Message-State: AFuF++mAuPjzPT3l9ksAfO3wrQ+qj0vW9XUuCE4EPMq81tqXkiJtd23F
	Yei3Bqjf7UU2eCrKp4twmi3/+9lLBrGkoUqP71HR9EY5X43vjnRzoNVyE6MaCcRhzYpcfVPFTf1
	fRoaaLK/iXeZMFcYEPxsDVAK4QOtIBlxGhQLlS+23kyaC3zCzBTOUSddVlViGbPc3
X-Gm-Gg: AYBFou02cXrkecZizxQ9jOsaZVFLFi7GbGbJcJ5w/UNA48/4tfisA57wIDD9MjIG+dP
	SJLkptUCi9AGC9xw0EFhusR4YBPAO/6rmHSDNjS4gJvr1vMmvcHR3OstpWe3qeVKH70+23UjCM2
	CuWl/wQWFYAYMhaPzgmQQz/jlsB5D273Nc3wcdw6jh/39KaUET3MOahPb5FrC9nJrPFvPLDUIO4
	C7ZNOg9617/bX68PtlAE1iOX4pngn/glsiigtsJGYy3sW/8YPs2vEt/vWWd2fFz4C4P+m1e/A1h
	McD7XtkiX73lQ18uKe9/uLdBXDe+H21o6ZLJnvdLyJ+8UDSCKD+QWYnLHnWLvSRi5Ku105PMbPY
	9Sk6wZht5EtZK0Q==
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr189819385a.24.1789371356386;
        Mon, 14 Sep 2026 00:35:56 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr189816985a.24.1789371355861;
        Mon, 14 Sep 2026 00:35:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6ca584f8sm193953345e9.6.2026.09.14.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:35:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:35:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
 names
Message-ID: <s6ooiniexuf2qnrjqj6ub6uxhecpaxsnqpoddny64jsu2w6nug@jr6mzuv2tl5n>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/CbIbXkqebpv
 IHvmf/39CTlBuXukyNVwDRGCWA+GPRczztA+2HTeVNUp8Wd79+zOWqPf1ISJGQHw7Ag1FrMESV4
 lLD4hDmA++v/8FORUwHKjottlSSZy+mKhxEL5XlyXRyVuNYB365V2ZiLqRwN5S5daf6vbWdZzYW
 Fl4BWGwj5BoRXn2H8lVR+6uj4WBqed8RxUx80LybS5ERmLa0cp580YHejo9lIEFpLAw+pOtXFQl
 AJtUfrHa2qtpB9JSf8hdJm8RI+0rpKRBxbA4AwOpUGhAw5fjlsuwLrTR6mChpCCQgqlbElpht8q
 YvDOn9ebi8JpXAQm5ZjgSCbc4HfIeDvM2NpkojwBvLzo8AMXRCfRnErZ9y+oj8vlqijNgZETqfz
 ANy2RJSy5hc4oY25S7sCkl3kFCZ7nYXYovlm9ESiYlWhDo1RtIT2A5Zk1SFffmCXO2BYlOVx05w
 J9+nNA3pfb6J5oa+0vg==
X-Proofpoint-ORIG-GUID: VZ37nwc6hCXLNvyVgJatuAyVoC_QY68j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXzoI/DlL70yy+
 4zYVY97fHNElPtnBLVcqPDoDcm3ugCAhCmjCeVvWCy2/NgMdzEI+vyHFZfqgddY0dDJyanc+Mli
 uxLBxtXR2fNryvou/lXHRXUY0MLRJG8=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a3dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: VZ37nwc6hCXLNvyVgJatuAyVoC_QY68j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:35, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
