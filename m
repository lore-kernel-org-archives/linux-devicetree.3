Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DECD40DB5A
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832603; cv=none; b=FW4WUFiAHRKrtqclJDs9vM/62/ccjWTkYjCQTQMtiQZH87s2IWWdj0JPlrpFiq0RToY1g3c9xieS2W1GLh9dYQB/Adaw5JEanKuBPw5o6kukiyWE9LsqMVua3iyqZwVIf6P/Vo9p2Ioi8NWcXQFlcNkiAM0VaDeMgOlZfIqcmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832603; c=relaxed/simple;
	bh=5MWfV7JtZD8FvT2forTlTQOkThUV4gx53BSMGlc8wtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNcLcwsA8heVdkT9tyn4mAbOXmv22Zhz11CRv+N3UZephy8rgTbc+17tkQk2l502uquILKm76mj/nbIP081JjZqqlhnECHL7rJ4Is35ItBI/i/7WhMNnyQBmn7dShR4DVvOz7ajs24Pk9UtrZvh/lxd+V/C0rqw14l3LLEtTw9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7+lPT8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwSjSf88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7+lPT8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwSjSf88"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CA8l3300199
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 08:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CtIYfvuQGYpPMIfnMPrF20Bg
	ArpUrPjM17HZ62h4ejI=; b=k7+lPT8A/gPTokolX0fs5Cqn5siQ7X9XX5HyLdfw
	B06p68pV97/se7TCwC9pJZ9lC7EzH4XDbSdaIU60uLblC3wlqtk3z8UZ9ya6W4CI
	r332ChGwVYFkTB1bnhW7pDea2Pqrx4Zj66BG/nAPxQlkan6h/RgixXs9oMOHCb3h
	DupWlGoPzhBmCe8rzulZ3suUGgIfASTEEG4+jHO2unL7c1NW9rTGZpUzB+c4FXoA
	w1O4I1Ta6mobHXNYHoRZ5PjpOz/X8wY2782+5DzpjZcPdcP85Wp7Kxoz2FnRIsNB
	v9dWVB6wM9E+C4EqY4oDSoKa67a5Xn0amsvrasb6kkuQFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8anch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 08:36:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so50169505ad.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785832599; x=1786437399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtIYfvuQGYpPMIfnMPrF20BgArpUrPjM17HZ62h4ejI=;
        b=jwSjSf88uFUAd1hqOyo72dE+hw5WoUfr1u37qoI4dHvL1QQY1lnGQhA/WsxOsXHSNr
         /sK9/i+NORUVRb78/Djcbzq7/U29FcNvu8wu5yjZDnVx7vvMRWs5Yr/tJpBr6PJQiYGT
         fB3w3hL5gF8Cf1hU+JDSkREILuiSUfBSB+i1Nrfd14X0a0vZzEnSFBJmjRHJxPFG1/Gh
         uRAHdHEMM2jz/ogT2+BvUET4kxowI4I9EoD6SDikFtCsOh1M1pMwhLAytGlAU8TAVwdK
         ZLwDrims8XarlJccSBtiau85JKbanOezz+a8nvAjT9lKiP9xmv0l1ypv6zctTwOiyFEg
         1YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832599; x=1786437399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtIYfvuQGYpPMIfnMPrF20BgArpUrPjM17HZ62h4ejI=;
        b=YQHVIw+cLIigE58oxB8nywQHVIDNU2Xoyf0FQ9nsLxRXDQXwN+KRqtRb8h5YDZmW7u
         phuXoQbaaaRVLxdRfimnhJtluPEbiClaB3DNKsB0P7V0dOqu9NkJf/6n7TwDQk+98SxS
         cSbadxPv6afGvETMAZWAkn4cU2MUdu+svMMwjpu0/2lbrUNU9i7+FnRhB7JpRv+ON7fI
         MNmZV00ENuVY7g3NzSamBXxEkQKDKF7H22TXHeczbbg6GL1AmixVCb71xb1PyoXCNi/z
         eBxkbILSgK7PEwngnczemy0tfWh9feGDi69t5wPQj0FjLLrrqJvJdffWPRVpdNDk9fKZ
         Ys8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2z4vTZnbShX1/iLrVKdnC/TrhJP8F+d1BTM0+pV1ugRSXZHvezRbftJAdvBXG6Jx9No/LG0o1H6Fr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5/9GnIZqWdmlMjgUZc0keF5PxrIxw8zD0Jl6TRC1CCGlTz4uC
	4U5vb+hvpht/3q4MROW8LnHEsNppj8w8h8FDPscCRDyChM9S0/dhzvrEXvc/nHPh48c5ZVUefXn
	LL8eIKD8Qu40m3aO2jDWw2ZlnrYTRnhWMRdIwhbWSZ2huxlBC7un7rVQ35eZonYmc
X-Gm-Gg: AR+sD12gkuXqe0BW5UXeBlRxypqxAE2rxzUnsaRvQ/M1gSl3Yy1PxhC5bFM6wVZj5sk
	HhS0y6zdEU9ebv3Ryax3YXimtnCU6zknPOe/9sJfGeH2u7IaXIPy4alCAIa384GrtwWz8FnIvjM
	m36/XIkfUYSstGRVLOF6TxSThhgtCrh52hdvIqepgAVH15Kk9xWXv1BlBiThRWP3sjobe+V28fn
	Wq44HaPy4+8TLWlJFdWCZL5b+2C2VB/IlJz4GkhlJJBNXzJDPDVUVvyAc/9aOLOfQjbxL8IsfcR
	sAQ0jwGtRMVyZwcyUbxEJNRbNJvwFkYMiswxxh1TveqYNPw4njCKCYElR0BIXfqV5i+OEL9GaWZ
	/A59ZQiGEjZIcLQ==
X-Received: by 2002:a17:903:4686:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2d0523fb501mr134869985ad.47.1785832599252;
        Tue, 04 Aug 2026 01:36:39 -0700 (PDT)
X-Received: by 2002:a17:903:4686:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2d0523fb501mr134869715ad.47.1785832598731;
        Tue, 04 Aug 2026 01:36:38 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9ff4d61sm2987295ad.24.2026.08.04.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:36:38 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:06:30 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Fix regulator voting for the Qualcomm SGMII
 SerDes PHY
Message-ID: <anGkjjDJRRMVT7ds@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71a498 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=qZ3wfW_fQ0jb69Zj-6wA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA2NyBTYWx0ZWRfX514GDqrdz2lg
 bIKCjLTnUq7pqRKitAlnJnUBdjtsnlLkx43kRRD3m6SQnaCqoLQvwOd8Dr4x8vYgE0lIade7a6X
 xq6UmC3LF+uBK6wfuK1exfIr10rLdOgE2fSFpVL6LODD50dqlGIilb78tZsJsejbIfPocCOUEl1
 3Zdhgn8Vk3VNmjiY7H5Rv98zAqwZRESt5gaZ5QBzRHmUoNzzDPbkFDJsRGrUBql7N8cybOpA9BU
 jhvXLsqn9++y74ABk6ljkrsVhSyMmRII7snYU7u9sZmirccf4N51la2fcKBug2i5U7YJEDrr0EQ
 8lESZb0F8SPJE3LJWP+PbjNRyxVA27cuKgWDs3mmnmU6i2VI2HofXogkIlXG2B3SKrzXlqcko65
 OGVV2Z+acwqngHeB8iW6gvgITZSC7rM4IgI8+K8KOherCgi8ofaOgxfpbyAF2dKg57guL6AR0aV
 K6lSrInOPZB4FXkIYug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA2NyBTYWx0ZWRfX/mf09f0eB5/h
 IGZstNHfm0bckxRzIf+8PmbtgouZCEaVJGqAm6XIJdg/q/bgVygZSWqClDC0J0MRkrW4QxbF89J
 Xw2cpLDSmwKmjcs5sMx3Tvmkn34G8Ug=
X-Proofpoint-ORIG-GUID: sZSTcB2dRWPp5bjuzvVZvTkp1hz_Cejv
X-Proofpoint-GUID: sZSTcB2dRWPp5bjuzvVZvTkp1hz_Cejv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040067

On Tue, Aug 04, 2026 at 12:57:56AM +0530, Mohd Ayaan Anwar wrote:
> This series corrects this by:
> 
>   1. Fixing the DT binding to describe both named supplies.
>   2. Fixing all affected board DTS to use the correct vdda-0p9-supply
>      and vdda-1p2-supply properties.
>   3. Adding bulk regulator support to the PHY driver so it enables both
>      supplies and sets the proper current loads.
> 
> The patches are sequenced to maintain bisectability. With the driver
> change, the PHY framework will continue to vote for the regulator
> described by 'phy-supply'. The DT changes which follow then remove
> 'phy-supply' in favour of 'vdda-0p9' and 'vdda-1p2'.
> 

Sashiko raises some valid concerns [0]:
--
1. This isn't a bug introduced by this patch, but I noticed that
another file in the tree, monaco-monza-som.dtsi, still has the exact
same configuration you are fixing here. It retains the deprecated
phy-supply property and lacks the required 0.9V rail.

Should monaco-monza-som.dtsi be updated similarly in this patch or as a
follow-up in this series?

2. This is a pre-existing issue, but does registering the PHY provider
before setting the driver data create a race condition here?

Looking at the end of qcom_dwmac_sgmii_phy_probe():
	provider = devm_of_phy_provider_register(dev,
	of_phy_simple_xlate);
	if (IS_ERR(provider))
		return PTR_ERR(provider);

	phy_set_drvdata(phy, data);

By calling devm_of_phy_provider_register() first, the PHY is made
available to consumers before phy_set_drvdata() initializes the private
data. If a consumer (such as a deferred probe workqueue) concurrently
looks up the PHY and immediately invokes an operation like
phy_power_on(), could qcom_dwmac_sgmii_phy_power_on() read a NULL
driver data pointer and cause a NULL pointer dereference when
attempting to access data->vregs?
--

For 1., I can either post a follow-up patch or add it as part of v3.

For 2., this is a genuine pre-existing bug. I will raise a separate
patch to move phy_set_drvdata() before devm_of_phy_provider_register()
to close the race window.

	Ayaan

[0] https://sashiko.dev/#/patchset/20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com

