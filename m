Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C5037EFF1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421789; cv=none; b=EhrBFpA924c6OJSg2kywVjlQGERBH6UMRey48ONvcgZOR9YGftWLmPxCrRnTaW01wvPq1MiAQIcTeu/yrBOX3T85bYIB+uWb8bSsjBytZDhaucMTwQRWf5mZ5UKEqWiGt0HlP8gOUgAs2lSWwmWG5g6TiQL/38Um1t49WzZWo+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421789; c=relaxed/simple;
	bh=ksv/avRnK4UOBJ1PwYrAwimKQy13c+CjYXmlx2M+y08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4+qtbvjO96um0FMF+oC5weLUgdbdZNxI3MsPtenU893nB9KNgtewvFECQIiawYQqoLenXyjTnxtXcHXr9dZjuKZT5PF1e5mcG/VRF9aIWc0m2zr80h8SX1SP05jANQiHUIeB4RipDuv/z3/8kNuGYbhZJjsdtPy5ESwZWRsCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1oxQjw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T13BqZOg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1oxQjw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T13BqZOg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLsG3113943
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GHibo9Blx2AAUlYEMr9nHfq
	J5O/B9F3H0pQUm/H9Ds=; b=Q1oxQjw/FsamPFoT6xhhMx+0cOMRK02mhvy518Zk
	ZrXvctXVLhqBKLXcq4ksiw5hIGxZ+3HNBq1gSumdq+mfme0gCrThrv6fjTC/3szr
	fcUql69XiY38pX/hu1FVCSsB18qPV4I1s/Q7ZW8Vsb1yhRCumW/iw2Mx+vY714OH
	cgWs8379I1YRcESweUqdhoOZMLDum2TutAL2U9Kn8yM8ZGUUna6IUEPmRkuOAu6l
	zPyxT624VozAINaIfXnQWowqOT/DktWhyIzaao3jC09xhf72qZx/7iWtJiHWAWMU
	UoPE5fl5QxqlE0ht3rdJ8qW0HxunKcTeO0+31GiYmClhHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs06x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:49:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso349345285a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421786; x=1789026586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=T13BqZOgjfdoXUEhABJkkafh26fRsW28zEpYhfzCS1Jv7ehhaToPeksB7/T+82WKuM
         LrDVubgDRs3JIfrCGmHRtD/X3gW4mPllh2OAnhkrh4WwDm2PU7KUCKiMiU1o4PYGWNzr
         0VuHFFnmpwEqQdj4wWfyXeh4N2hVRJqBaH4H7/IcJLmZGGBtzYogcfdcoFa96Rl5MKc4
         XFxc1j+Trv+H0jX93OJ1JEVvrLTRjNFF9xWFql+ZbNVDOkUP8xagBedXSGAXMAhxMke3
         GbwIreI1ckQw1v0oLYB/lAd6rGnFB33WCssMokVA/tDC2rrrP8fAxLDfTXmQ0QHZUzYG
         pAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421786; x=1789026586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=q45nqAjGrn7wA+k8BGa6tocpHNiSsM+/HUVZ0jP3TWX7m594hHvHxsZ1sobYESxCZo
         d2601REWcs21W/ejiS3Vz6fR5dS6/q2Yh7HDlqpBILIh4XZnQuzBWXbZpWGlR1lZAs46
         9T5oPiH7nhI0mhst/gGAV7crGfA4OIu7Ldz8bMJxQBjE7fq40k9NDe9qwHmEcZFNLDgo
         2T14Kbv6oHyxn8A5K0w1I2LzG8CTiyOnFRP4+9aEn5wQDqAbuuguhfNgcrF/6HV0eD9o
         H+w7biYvCG+P5jCYJTtIOIqPgDtAmc/wqIdcU02NiQHnMozrCNfdGkDIE6kCpYFHLeX4
         hB7g==
X-Forwarded-Encrypted: i=1; AKwUvBz8U+ebPfeEWJ/kQYetbu37bRQUfnYkDOxAeI6Xrfn7jR+uF24WPf5Hu3uRX/I6BQ3SyvCIOGvgSsVi@vger.kernel.org
X-Gm-Message-State: AFuF++lZq8pjdP/MJHb6JryqGsOu8jAP/Uxd1D0vpLVXUgl5lD7JXpjI
	kn8QyJYoRbz4BfxCt9f3to9aYigKa5aEEqg6pOAMi5PxkMhOYKlkLqjzp2ZNFUbKBU7EU5ld5N1
	5mzEUxNhWSjXIGPEDbT/RwJ8LZwrUSlTKOUGmFSGD90uQi8o3QRFYHDJ+cTFmHxHC
X-Gm-Gg: AYBFou35QLq6PuUaNTbX186QH/1bdu/3Amrx+IDXj1uvwQTsDAI5yETwP1AxaPq1mXA
	LVcvIVCWabhH22odi4fgwkEOKEbtr3EjZ6bVW8pqEsAVcuJcJ6vxnNzwCS6U7esOclmLd+OSMIw
	DnpjCXUG/h8vPSl9L0o3uvYEW9w9QtEiJhXUuPw2039X9dDQRa8CpNimGcqN3oBHQrk9pr14Vy5
	nzsXbPT9fu3kQMudjNTqDMRzeV1hCi2FSSyl671XlPopV8VzLUMnRhX+6GFpDPPjaeELID9zxl9
	x5XCnKv0Td0J6EaXNkKaTUlrw63hQPqVGRSSivwkNwWWP5Fw1SLerOG9y2zTfC9bET3tbdtCRqO
	d6ICeV9sgVyKlCw==
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279825785a.41.1788421786022;
        Thu, 03 Sep 2026 00:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279821485a.41.1788421785465;
        Thu, 03 Sep 2026 00:49:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm11219681f8f.31.2026.09.03.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Message-ID: <oznqr22wo4tuonlcs36uabppl7anwax6hcpdt4j5ppgjpmkzha@q3qmtizrtzam>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX3TB5hp8jKZbP
 DtGkakRAxdexKC3EuKnL2axIgTSrtuBWVwJ3zCPwCeXGq4GwnFXWEhnusjJqq0H1wyQHSRiEdsq
 mRXKTsgfrOGEQtshXI3o5q9bhDFDFWgWtqF8u+yaQpYTxcEYocoFU5iDckzcuhgk6bJV8F6BLoD
 isQJ6OSYNgdv3ktufo80/5V2nLEVcr7euKX2h6+dacWXHqfjOhk5anUEcZs6W70YZDbLnwuLFXe
 MtjPmzxYwetOYVFdltxbepd1jWA/fRyUTZmLRZKyWXhNb8RSQD1B+fYBLIHN4FTQurfujLiiUte
 VJobFUkvg4hPbdfvZhyJgNe4lIQ1pv7I+RDQDgtc4ZnnE2jg5cSCLn2MBggghUhDD5ox9uMYljH
 ipU3E1/7kLqyMyz9xaMTf1KZAqL+XR/WCldv7QtyW0r190Xs0IVHLROCTe901NoBaiPtgqHeSQX
 tQZDJxLpmlQUnj4aU0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX6JyARzEeE6ja
 UbUh2EkCO6RcFcQnV0IubndV1mTrD6GtZPEP3uRHpuEKNT+XunnJGJHsdSk0jnHW7VCmK2HLUhr
 4bL0FwAC6NaoBZxGO9+i3JShWSJvRd0=
X-Proofpoint-GUID: ToszPy_pJoSJK_lJYKtuncpd3_BbdJvY
X-Proofpoint-ORIG-GUID: ToszPy_pJoSJK_lJYKtuncpd3_BbdJvY
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99269b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-02 21:22:25, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
