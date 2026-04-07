Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589483AC0E9
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578730; cv=none; b=TsNdn5ED3Xp6f9rTZV+IEITaLLdYAQfVfufVlqiXkjAy4fZ8QDmPH08MMF8Y1CNfMeJVCKc54+uu5CSG5UCC9wdSV94N9XYXKo4ue9z+UNXaDj+F04+rxtuBEIHQPlrnFeRrvOTCxHGgSucLxyGY3JjKdKk/IDYSAY2poRTvWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578730; c=relaxed/simple;
	bh=RAtJyF66DhDwL+sw/f/kcnSJ32b5ywZ3vaEShno/lgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcDIUQ12txv+QZznzXzp3HBHyEJ+BLmY+3opbeRRpKBSvMcz/i6k+q97ALYpEsvxJUPyPQAHCCgaobcB90hJ/6m9baRUxacPUeW8E+0XDTgQQORB1v0dVFYtr0l9iqcktgLzi4fezxnPx1eyGMjIGfN7skNZGfRZKRzGZ1AFPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBbbzXQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmNLSa5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBbbzXQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmNLSa5x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DTxkM1584991
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6jK8XeAJDMVoLv4UiVwoG8oc
	0Pxfohm6+YSS7sOvVz4=; b=YBbbzXQT1/foTsk4PrQGIVEEtm+zaDQ6yLZafME2
	tf5h0EPNIjmEgweLUwkPJaCpu1hTcEi18kl28lk+GuJPGv2p9SWuyD2tpAc8eRGO
	mScubiMg0xUBrn4YyoNLaUMKDZM6ufhEapFsBxPexf7BCmUAJhuxWP2ad1UC/f0a
	hMlMiaZBRgMs7q6xOLE5H6ouUs0vqcWClcE7MJjTxO5S557cyTWfcoioeoGgulOe
	2T0DEjNqdbQIvcMlLbxv4KUPIiQTWThXDDNhFd0pD8GHTtoonOU3by4z9e/uZ52o
	1MFf9Y2/iobTzlofv839oYQQGOqJP41wqpPWoVtbbyPPXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9ukem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:18:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127337c8e52so25538427c88.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578728; x=1776183528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jK8XeAJDMVoLv4UiVwoG8oc0Pxfohm6+YSS7sOvVz4=;
        b=QmNLSa5xEfrm4PKRnUvxXKmRhZRcnte7rMUGD/UOK1lG1Ly2yYJNia0Da6dcegsnH2
         F6fRUlR6CsDjrgQTEJbStATJbtrum+do/Q97PN0j5xho0JKAQpek+skqx6mJPKIfQqIp
         CADN51PGcP3XjS+E1F30q6uGdyVygkgYnkWD73K8NJ1gHceD/uUf4i/i0ejENgEV4oZh
         KdqwXonDgYWpnrw5mh0fbinN0biznXdr89+1z5YY79q6LBiUQ0e7/YIXPOClWmb/IR18
         iNmfjhfG7Yj4sZYNs6LQ3D3or1Qy4k9jfyemYscalm9pmFxKuOkd/FFHl8wmPfRWAsQG
         Jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578728; x=1776183528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jK8XeAJDMVoLv4UiVwoG8oc0Pxfohm6+YSS7sOvVz4=;
        b=AlDCdkFwGMRVI6QPLk+qe+Co1qg9uQReIw+bNfxZmb3IMMffmsZCb7v9nDUpP8AeAS
         oEr5YE9Q6d93F+pU4JECfynjBB7OcdCsk2lOyR4VbKIT1FEgrKjkrp1WLJ+7UdqRrc3m
         Vwrsdnt89nmYk7jLerDT90gN635ogDvX+9eO8ON4h2FeCPC4cJ7h4KXqNYtgBc6HlQ+Y
         f9FEE3HlGAUKdEFuG1mfh2e6c6vKl6e4Tn1pd0F0mYlLzbrVui6R1ThnAd5HIRDQb6T+
         vGVvfA7Xy7yHua//GJ+SlLBu/6oItAWVmrfGU1uHeceCl8pFPUFCSsbmF+t9lzMvulWI
         DuHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9O4TIjc2jSjkcW2Wwh3496jWuQz/NBuJZYIz+aUnAOi60iBQqA3WPUWPizdrTPbD4JWSJwnV9vJa2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+00AbrcKZAFldS+pi2EcXpQCCudDzVlcAeSJt6mi8b4/b0wvU
	eu9ziiekTe99vMUai/ZEppMqoRj3UEHCngH+Koo+J3SgiPPvNea1c1pwH39JPljml1bhfjLjLud
	2ir9QBhs0KhV4v+3E9Dnod1hl8dPQgz0FmCoVcDOTmEOAUFl3q/40hvwbLKUfyg5B
X-Gm-Gg: AeBDiesVM52HgF+afUFdzvWIm4/bwBIp4q4dogBKT1UJZzNiMBedmHn8qRaQZqparEt
	+sW07UlFGB10Eza+t9zR+fRZl/W/ox34k1TcF14pInHj0HASGUWoLuP+3a6OZu8T9RunGjbD8Yc
	hRAAp6TxSqhByys2ozBnGkKIHnAZp1dXXvtfDxgE+6Lvq1jkO8Zune+doJJP/nxAb2DEwq8saCX
	us8DkY/CQlueCRPTAMiyYr3wi6fzNfyU/naZpz1AfR6ZYU+/ajws6DmCHhJcphGTtwVVoO2dZpm
	ZFTs2B9QsuM/fonGW7taBysuQb7lMlqQCTsPInIZiGhelyh7gce1U8P03LDoh7BmhsDBodwq0hf
	dJS/Xu+EshjC+8eJzXAMKUqrIdqTx7gSaIfjq3vYFHy9LazjSmXJR9ObTuGz6aRE8HMSDELRdHW
	c=
X-Received: by 2002:a05:7022:43a8:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12bfb6eb3aamr9511974c88.4.1775578727897;
        Tue, 07 Apr 2026 09:18:47 -0700 (PDT)
X-Received: by 2002:a05:7022:43a8:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12bfb6eb3aamr9511943c88.4.1775578727292;
        Tue, 07 Apr 2026 09:18:47 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c14a371b1sm4339123c88.13.2026.04.07.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:18:46 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:18:45 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Hawi interconnect
 provider driver
Message-ID: <adUuZYmI/avXdsPJ@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d52e68 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X2bA-DTC1ecWuKQBpGMA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfX6392/g+CIO4f
 DmNut+fLbOuQDIaI1XZSeVmGFMbjxNh/qwA5i1QqQvPTZ9zeqL3cWJhARGN5j+59w+XQLEGmslH
 nDQ10UNA6W+PazbilLdrM7INTy6Jegb6J9/ZEpFebaAhdzEuIV8Lo61CLwXIyzgHDUNir9+cpZL
 kNfoaFlicHnHeZk0pyB61Z2HoXpUV0cKKeFqriZyHSjq2FwV+O/W3yUXzgokqXSBlbtO8yjO2tb
 +KUbOybaG6It50O7dWoYC354JgOPxtjf0dl3Bmsdhjb1yPh0BMy7mFSp3aAj1UkxpB0vuMz+LcO
 uN/kf6cGvQCyEy3MwCVOosZupRicUVgx8vU3GqQG4NdJ2hRQk9O3C6ZaN8SukD2HyO7kLS13SIS
 FNWDQaUCDIfPz0djX9PxsWlyi10LvyUMio2rVpCeKwbspu16fE48HsNV3JChfnj/Js8sbg09rt0
 WgLvgLLLVwdB6NarhxQ==
X-Proofpoint-GUID: MASrJBBrpvHqAoD3kTws0PBy_Fwh-B2t
X-Proofpoint-ORIG-GUID: MASrJBBrpvHqAoD3kTws0PBy_Fwh-B2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070146

On Mon, Apr 06, 2026 at 04:04:42PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
