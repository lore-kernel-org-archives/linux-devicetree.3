Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA7423E8B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530277; cv=none; b=Yu40OG2sPCUysVKltz1quHa17HwwTazUNVaokkpuDurXib8mkiHRoWoWY+Sl4yh8x5gRKa96EwwB672yXdbcfHahudf92eM1JmVqjo/4pu58DiSSic+xbyW0wE2ThvGgA7YYHefQiriNTJ43bTBro+DLGQ3Hfoo5/LH5QTSQuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530277; c=relaxed/simple;
	bh=k2jGqk46sF1bLdy9ZIJ4CzjL14SbrH9QV5M9xpSxDfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4oZeretp752qog9vLiIqElqcsLyKyKrLVvfYx/Sd5f4E46KBfdUupqClXzcmvbFN99jqktGZkVHk94rKdb88duqRa6LPLGsUFDReghNMvxH9/RnrJh5EPDxYnOyf/aUG+qA/ZJJR+BvnMHa+eCT/1bU1HY7feZTPRlEaRXuBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLz45Rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoT542if; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLz45Rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoT542if"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fgP13082700
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mGD24sTGT3wBWExobgVbY/RH
	IhyIVBjaK8WNignEdN0=; b=nSLz45RkGSIJy5nhcvKdBAKmB4Stl1E8gnIrIVU3
	bEDjFAQoHPb4JXBkrefsxz6aeeXs5ARQc5tcmBJBk1nT8vhkD6r95jtOUFhx/BqW
	jYEYoGocjrSw/hk6hvVj5rnXBMGx9+YmmwGsRXQyR571aAIvwFEf0f3KlpaTy9Jb
	Q2VElLJCOSHpVGLE0e2Bk7BvhDapbfscX7ZcVbX0cbH8HRtogse2yGGNN+Bz40od
	5Hyj4nCjZhMTJmPgbeJPVCZGIFS/ULZMRgdRGOhHBEn2v6hwDr9r0UL3JbnBfSeO
	bJZ6pxiqP1XNZAGOUHajsYNrr/+ozfIgpmh1zcrBFcVJ6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrkbgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:24:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so7641621cf.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530274; x=1787135074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=ZoT542ifDzKSTCKsJWtM3MjKH2LItk8qfdEyA/4zXxry1xDO6+Pzh70DcFmoqUwYy6
         234aogyQeqRunLB5beR3G2HYULUb52dEQYvii6yZX4KCdmSekbLdjaLwMAejwxYjXvrA
         iQiFO1/wXXGieF/BDOHsl6khQdu5qx7xP87bzccLLniNX6H64LLODZY1M4M/4V9ScFF2
         LUIkTOqQd4dsSc7DEGDjuEVoL/4LjSBa66eQ8nt+unVwNSrCt7y47MEmw6PsL3Cfgi8K
         exSUdraC4F7eQEDSEgp3v3XpTtpIrrqVV9guI/5/Ec2f05j9nfote/si9RkQJWL/iEbY
         Cf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530274; x=1787135074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=mTgOximHQnvlOSwk6jM/SnnNoHXBrBODN20X1iPNn6WA+0tgQFV7Bjcs7/5OKUyszz
         x7JPuerUvV0VHSFxPJIua0eaXb6EKeph/xGk4JrFrgE+nBSmQFaieYqU/oCBoreRUMMa
         m42ESPi4ZtG0OajEMrPoXKMN8GlgAmLDtNKJfj595bTUHeZx461HjsPi2MarEyUHUP2I
         Z7V0OSLmg24Fr31g2oZfiNs8ni1/mT9PPZLnObNjw6js3lQsS3/RyKmg5NMqTuFGlFhR
         fhmEvT8SN4vSfFP5fhHvLVBmiDcKxS/hihp/8HofZrQY6/v9ZtTENGcDGl5gd6jPiBTN
         T0Cg==
X-Forwarded-Encrypted: i=1; AHgh+Ron8XRRJdEwS5yEk3QMtfBvU//7HRYQsLag0AIjDb5Xd7pLTxVBVk7jY8OFTyD8jmT8oUkyiD8q96UN@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBxPWquQth8QWXsgsIWCU/iV8sqXWgItYUAixaOS6zixU15Tb
	TiWQ05cUU4/Dfn/juvaKh7jRkrtRh+mXJwfUOWqeJcit6RD+C2a3M3G4LJLgZA18fPxUWRyukPz
	DJ0kL0fZBBgOCw6U07Gv8pueYIfRtVWS7hfedaBC/Ya7Jt6d6JYNMt1AvzG5xhoku
X-Gm-Gg: AR+sD10hJ1nlIsYjYE+r1RC4uAMlw7WGLSTWTMJrVyOeVGR0G7KWeo7b+YUKXKYc8v9
	ishDgW9fhwPVmT7+na9sFeKFr34xnwqAMMvKaV0HpYU2MRfBwHoJTaP2h/W1czTX67rf00kA31M
	SjdPvmHOLdWAATpUGWwpJecIok6JbWCCdpPCJPLsfTSb/r79Hd0MPEB7hSIPfHArHjvYqd2D1YB
	9OHmYZyXsXckQRxjxdDV3KCSZ175bH+1OVA5m8q6VLtRWPeDsAr003mqcG28VMnOgl9Xj/+k1iy
	tZxcksCG9NJXhADFiYSa+5HF3ww+u9hK6901wQfh56dx78GApB3c9QuyBAnAXeileVPEbs+kfbq
	uzGqDo28ftr2hXNE=
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29058001cf.19.1786530274233;
        Wed, 12 Aug 2026 03:24:34 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29057501cf.19.1786530273692;
        Wed, 12 Aug 2026 03:24:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm58938035e9.2.2026.08.12.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:24:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:24:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Message-ID: <a3dfeej45s46qkicay5vsnfoe6ndnllm4llmqbcgjvw4unknpf@tcl5puha5qxi>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
X-Proofpoint-GUID: l5lD_Gjhua8DDDBd_C_8BQ0gzRxiXKY1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX+S2/FD4bTica
 qJQwYCY23qRb02IcT4yy0vfSlrzd9Byk7kv53dALH+h3JAg2vY0jTa6QmkFSP8xS3KWVcf44ShJ
 PVkRBwBYNVEvl0t6OZ9WFPI/v9fcYzo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX6gZfMS9MyttL
 QavxWFRgdOzSyx/sJhocYvA2WuotoewD9MfEAoY2eK70ww8jzBLvErRVlENYbP5nUExh3Hyqvki
 xJkbu5qWoHJSl4crfKkseN3LMZnJlezEWF0x/VwA5dFZaVSq7spcqt36qWPTmTA5NIM87GVmYgl
 5sWkC/ycyMJITBvrwqTNypSzDB50+UNSL6W6J8hXEfqFKynK4i9u39iv9DvqVzObpSTyQKr5/x9
 FDLroK7wv+LuLxt3+QoycVoyh49h/c+ynHDDM7Exre5E0ZYSbKd851iybxsk1uwLIi+2VqcdzR2
 RjtqaRfO5WsRRk8s5avc8qC9LTyHxJn89zmMgK8CG/+OoB8lBZVxrftxxWAr25c8sdWTr+/EdGU
 YP1OECgIuh9n+tqlXVqK7vZX+JHPyMCOPOhrqCwQUhjFyaKj9EzhZGZLEt4Rlmvgkhdu2v6BEcX
 5bmtHg7qWcHEseOcSSQ==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c49e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h4UwG7AoVW59HMWry4cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: l5lD_Gjhua8DDDBd_C_8BQ0gzRxiXKY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120083

On 26-08-12 00:27:32, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the x1e80100 driver focused on clock metadata and reuses
> common runtime logic for regulator handling, enable/disable sequencing,
> and OF provider wiring.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
