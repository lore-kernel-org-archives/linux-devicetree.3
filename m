Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846203F6606
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418191; cv=none; b=XWDIAQCnZYDkO69Xp66GW+Vc3SRel9ZEwQjCJ+fYTgwleszytZEj8trCiP4RvVAbubsWz7HNI2zZzC0VUpaQ9oKvIBKENbPiZ+ZFi9miLxfryZ+lKPuoKnaXlbKd2Nn1RBS8i7X5fUKc13fCkn8p5RDCgSFfhHV0BPt3xqJ3ZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418191; c=relaxed/simple;
	bh=8VraffC5BKkejHmJdMksu0LpOfb2HU7NmdH6wjOmvrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZ28d9g0eUj/srHwCPYDWj+YcEc8ZUr7nKdWaaBNy9Sv687P/GIyVDc2nfKs3tke23Ig3GuplW1dqmOGi6CWl43OBmHe+dAmrnzeWoXb6/O292qhA+rViOO01RQa5WClYJExscaWFMGAGDBgFkNDl89Zv5vPmuJkBuBIHdIzuU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blP2OOD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/Jkx/Dr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blP2OOD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/Jkx/Dr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lkL73642049
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=; b=blP2OOD+OBnEz0KZ
	dil2gbYrbsBizldaMvz9GXwB1tkzZaxB0DmqxJT/NtTsPeEKG5dIFKY7fb34tgEC
	HnE0OOhDZqcTTznCMJAgLRLeb2m0gEmRcMAk0op4ahjKHYil51FYsNVCxQptoN+b
	XeGOJHY8zT/HDynjAQ25IqjviJcnWy4gLrdt0yfKw+JMOJHYqpYhTcBN4DwI1FSY
	hvpZWw3SdEaoc0A0gEz/wecMOEpiXTW96poop/fH/30uE4KBB0RSk7So/l9NrUZy
	eUQtSadHAzZ183T67zM5QYUbxewZoNzeFlzEP9emxAHUpRO394MUhEWwFFyqcZ8n
	hEK4Cg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrduj24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:49:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so51479685a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418172; x=1789022972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=Z/Jkx/Drv7edbI2qdWCHpwwp2mG80jBmdYfwdqgp60gNWfKzCTcXICGuTshQqQUlnQ
         KYNFzY/uPcnJ6yVc2ShIIzATC5fAiwvB84MxBdUpMpu2YpksRW25XWf9LumWmmEqSXvJ
         xGnvB835FrSUdEc6kKiFF4k8AWxD6A+qm1CcY/ff1rroTQPJmP/qVnPXpx3Y0Z1VzK4X
         KxuPLVET9U1JYRb1bM9Hbu0Sr31jU+/y/KcZ+t7K5p6muwcLzbF5jEMTVfzIXcoDwY8X
         obWggezfwnbGnthitKfLFP8HxbBLaas4zvCy0+b5S4PDhJYqaP17BZsNAf84ETGNeadm
         EeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418172; x=1789022972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=mkt+HPxieyCLXefUelcsvNmInHnkvm/go3Bhek7J6uZpbqLHyxxhSbO+KUjxAIQ/vu
         1MuoFRBvgLzWIP1k8k+1EL++gRnRzTsJIEcxIvaY88/GavRRCoQyp2M/h95XVYSHdGGA
         gku0AGD9AOF+foeSbwjDu9h4mmM78D+dtfy3NaZUJc41yxajr/vaitXgzG9goqpjr39P
         9+oUy2aFXFxnLlV0YGtiviijicAvuC9Ojz3jCOykSivHObj9LQRFR32Xddu4Eh49/X4u
         BT3u6twPRVfJq1totBNBDZvURY+heX/XYgvX3X7U6D8NmqsQO1bBrrKTPlDwgjrPJinA
         lPzA==
X-Forwarded-Encrypted: i=1; AKwUvBxM0P+VfvQtUQ3L90hRfeUrtAl+ARMGNerJlxMnsdOCKkHznB1TV+ihecE5k+Y+IdeDegueNiYRGv7X@vger.kernel.org
X-Gm-Message-State: AFuF++kBMJ9oIl6CHf/aj/f7APyRlOZjw2LLEnYUPe6Ky1KdFYh7Fg/o
	AZbYm3ZPzYMHBTJP3wknFgBqQfJBniUMnEBssmbs6g4mV07pCa3m//+AdoJn6BYP9JYXFUkjezP
	wVgs/O46HR1FokgBL+AX6ixVkx6U3exYlzwb7R9C2Pxyz2dZPaWP0KBnGW/v5jJHi
X-Gm-Gg: AYBFou0WDb9P1EdEfRRjMOHuA17CmzRnpWAmVQjbMELXHWXkjdxnGjctOxtLSJbZrMk
	iZhGPhqmt8HTgqDE2aE7O+EICqiVJZ6RMZDi0lWpdfR3fvqLifA5+ICgLH33gRPNmRc84sUVmYn
	QY6SISRBupL/CfKqqGKbDhHTWV4w1Z7OUHNCVStx6FTrk8RdycYLuA2O86e4VdxUQwnWek1qyk0
	n3z/oAR1M+GRRZ5JIKXkk4ZPZX9/hKhTY5FF8R6G/TEG/z0x4oM646CjV4DqYmAx2zfQrFyn6nO
	GbXr8TwZ//0lKvRg1pHCw3lg6kBqoXRi4hOqViCNq851H7PE6Ew1bLEyGTElgs7GQA8zpF7Ooas
	+C+pYtIE/+v+8KORjazj/LQ==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777130585a.4.1788418171697;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777128585a.4.1788418171248;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm1779131a12.3.2026.09.02.23.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:49:30 -0700 (PDT)
Message-ID: <91e5c863-43cd-4703-842c-7bfaf2de877e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:49:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>,
        David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a99188c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UuFmc9fXMOtaS3I5idAjXvS61JEP98Pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX3kruGY1GxeMY
 btcCAdM3U1gyykmbDdF4Ehh6xAgzYcyI6C+yqGe3jXdztpIbgbETH03CPe6sba+DkhoWtN87zpz
 35VWZQE+g8EsO/buudi6qWclvaSNkOH1iTYk5fTygrW6xLPa9L/zzVMtFuMcDmZGgBKqan2lx0u
 rmxa6W+HFtQYAJPB5G27vjAtAFx4+YQdFta20f2Ng85kyFjydDaN0V9AZ6Epp5m2B1nyvHc6iCh
 CDMsfR5718TMhVZY9JZp757iG/Pk9o0h3G1XG0a+bYLg4Rs/qXY+8C/kb727hVsgezNDzoDrwc5
 coIasd6zSLA1EAqt7VfYWDGDbtQgPFgnRIXsyPaGURaSolD2Gn0gCFuNW8dKlVsHySm4KzgHgM+
 M4jbB8vkIRF9vGDZkFG/YtNCXnlXoFNqx+4MP7FzoU3wZxSX0KvUf1g0qsKkmgcLPavaf7OU3Zd
 q0t13aQ1TpwINj9hv9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX1nluxmn9iPOE
 7trmmSUhCsACl0xPJtbhLrQ1dsFIkpjFN0wJUO7N4OZwoRDbQ1WirabcJD7c5Wmwc5i5vXoQbg5
 V/bAlgDgomj7kpf150CByp7LV5qzk0U=
X-Proofpoint-ORIG-GUID: UuFmc9fXMOtaS3I5idAjXvS61JEP98Pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030059

On 9/2/26 11:22 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
