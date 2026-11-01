Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562339;
	b=aRk0G1Ug9w0NXRXnujaifW85mOa2ifbTkg8fbD1L9yTwnNyPR/ESspJS7JeFdu4QlSj1
	 CDiYnAs5fAzot53i9Wb5p870itLIx0aMWcRK/WksgLbrW/wQUc/k/RTdGE78E6k16ry3t
	 MCJ/TRDRHMmoUTHvARaNGEduJY1+iv8KYYq+Cs77mdLCfptpFhFx0hwOTO22Qx3hW8Dvh
	 4Q8QU0chkM89f04s5MnyV2RyvzqraFxyZ4Ry1X3XEB2ghKiMrI/oKFo2VMEwJAZ4wcr8p
	 I9lQIRwCQ/qnSlSYLwTz1yACIm7P3gXUrQ4oHOcpfQCOc1g7j+5jbsHjsHE1kf6IdxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
	b=LRPWJOU6tfUjp1h8F/vprVg0l4L366BBv3y8JsVCfhOEB33JrcqslshIQ1NrgZrtpMY8
	 K/LRGzam5yQklk02jfdjIVcFrs0SEWu5vGtD8qpzuA0hH2cGOKjRpMCYX76uu352Usw1v
	 3sbpRGU5bFazGOE6gVsIm673yfttTzw52C8jGWh0eflSrZvxxaG8g1P543wGplxC7vXcw
	 QoxMYWcCGhlTZU0eZqZin/2zayQMJtjMEdb7Goql/qXlYBOYp6mrNHsleTIgK6QN5tQG+
	 53AG61gt9Nh/y+/RHBCeO/DW08RwoWwu/rUm1HjDo6s1rGlvpLJKT8UmyhSThlRQyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49915606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49915606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQF622044113
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 19:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ne363uRV0Uu
	5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=; b=cQiQkx0oLy4c8tJpcRr7aL83KMi
	54VJie5sxkKiyuF3D7lI/6ZF3y4bN5rZOJkkyt5ILvhlHyeXjwBsRaETywSfFD8C
	oQuqFb+0yOpdwgoSz5nQuXtlGXZN9FtDCoTSReiBjts09lJK8VvEdRJ/Ds6egjLa
	ub0C7bi6mQIiz+nSCs85cIiNYYBGFSxuzsGZStJG5waf5/PUuMXcbI7D7RB/IhS0
	xnQUr9pc31XQMIkx2OOQtWEuwTlx02vOWPALA38AsOTb9n4YvyY0wCdKZxcoba0Y
	IKCc4XIbbGUkhQ+iRGQ8evHUSH5Qq9Dr4p84oiMGTx9QLzQgw4vhkCHt33A==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxm3h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 19:45:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6790b1d37e7so3847401d50.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793562337; x=1794167137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=M0nv6dX708wwA8gxBSbZZGfQGWo/SJIZ+bOOXGMrHMuz8d2q7G02M22hvBGLbFT7gS
         v3w8cKT+jLrotX+R4CTSQQ97aCfBv13TcCpSzsxN55ULlroTyJqcpLfu0mzS0W9X+ZDL
         KVz6nchHsRIdZZvr5z+mX+6nhM8wSAf6tBp8dfKpX+SGG77tsqBgIz4tUUlDCbuswoQT
         wMwMH0G4uP6DbPQK+A02kAV9qPiTul//OPCyiGvJMMpZl6837MhO6WDXq1SiCAx7pYcj
         Q6JU4BDu4c5Y3W6EHVWN+4BV43tjM91YIzf3relLFV/WFA6ZIpwibAugrRHKbfdWLZ5w
         yfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562337; x=1794167137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=tGZ0mirR+WwlPQkvJBsty/gMMaK94gnxjWIrdWXEgUxWMRhGvxMv1w7KL0bGxkyHF/
         JU9CXPvLJgYTcnqj74bxFLXz7VKu9xT7MkZF+Vx84oD3tEbZPTKefGso157HyT/Fr5sv
         /9gxry45aeNuPpbMP5tCuT0Ez+cismKxKjLlHpqEB64UN2etY/Sos0fHwWnJI2xZ6hEy
         7A8G1/0bRVv+CAueQ3ZF1ys0se9T6rLU6PlbWL6RACjcrtHa0ERepMrID5jswFQ67mCu
         sxTMFaXbk0wfZg1BU/0C4YxgU/93Vhn/AQ9pNFfHNKkpQ4WEKm6FPLP8Spmn/3tx5G1g
         KJxA==
X-Forwarded-Encrypted: i=1; AKwUvBztqtLuFhUc3SkkDi6Mw6schW8iA9LAUcpsF9bBhKXL0LN2mJkvYfY9aKwQbPFion0OG63YL1DACb4g@vger.kernel.org
X-Gm-Message-State: APuU4Z+e00iyZ/CzC7UGf4K1hqtQDp7PupbrhxVHNppPRo1n4jRNbWvc
	oosMFgJQDQQTKN1QEzxIkr4CP0SHX3aqViD3R31JCckLJ0wi90Eat3wsm6XLAZ/RWxFkDXjR8y/
	Y9iApKj04KIcW4WzgwXy0rdN2nJYEHzCbbNlTKofKqSuEP4JYqdXVVstmhv2tC3qS
X-Gm-Gg: AYBFou2v+ADjxXACgUddoDYouvOCnffXqKYukWEhho8PhgJu2dL8nlc/ITyKAOCRpxy
	KJdGaa80XGLdwMEIxZ9DWRikfrRvzomsZtPrpihp4x/cKp+3T1sPqay4B09ZIWwjf3nt8GCgbWt
	KKH352A/FUmmPlz4Gzso2x+l8wxtdkrd0nzUCo1KzW6BFXaDgQDKHPcBPukbrMKvDyAc26lpWBa
	2NOutDsPsB/vAdssCcpOYn8GX+pJiAUaIRE6/YUR2tETvTOQ6LQwbk4GFACmaHrO+FJMtK/Xyy5
	nbxw5FCbu0eVu8M/F1gBZtobnxvWhQaIEcIo2LgTj9daesrl3yxP04GSFPQk9Zk9xqkJ5Dhv9MC
	fR/8tMG35Lwet6aXgYsVKLhV9vWblZuXxFScLIKnMqXUfG5pVBhvXqklZ6EaBLjO6hz09E6KXa2
	pHPhc=
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238871d50.18.1793562337570;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238857d50.18.1793562337166;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm3698982d50.13.2026.11.01.11.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:45:36 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Date: Sun,  1 Nov 2026 11:45:25 -0800
Message-ID: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com> <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com> <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xOxaAzIxrzILHxQIQnPKnLmN1kr3Trhp
X-Proofpoint-ORIG-GUID: xOxaAzIxrzILHxQIQnPKnLmN1kr3Trhp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfXz52uC9OKGgwu
 +CL1TdWTwHC5XBIUgcep0CajL3aJZMlu4SOYZskJGMsYAEG3UjtTlX50ml8QzrE7QToN4IHXtMv
 62VrebooFtx/iZnKuzG6Sj+iVRVR1V0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfX0GHUjHRaBvDy
 M1wXCbLKI0u5xphgU3xaAbJullqROv8w40RYa75mhibolJBJSVeKIQELqeT60RVKaMZIyTNLbWT
 dDVmx1mNwY3X0MxCyUm05Szx5ZDWIYczSAJ2qi04Dryi4PIEimKHF4/UZtOwmc8vL83rx0vS93r
 W+ZFsF3bjrC8SoJS/8dEOlep/0t7pnQRo3hgI/s82h6Fp4Y9EcpasuwkC23bfaAyUeWg4UjIOAG
 poQpGNVuYkkyfazYzMn0ljeE+bfvp4dMFWEWlBuHN9DBB6cdonO+rTy7C9x7h5xmevnS+K6TZ0A
 LWHMwwKl6PGkpigCNgoucFb4cTT4lu5ckF2UkpujJgE4wL3My8tcugJSui6JgRZO3a054+hcdoa
 P65vHVm1QEukLPZlL7e0f72aIQj+eo+fRBnh72yJaJTvVFiqBDQ90J5GfoDWgyWBSeatxhNYow6
 mNyVvk18c2PI+/kACOA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae796e1 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=4qzK_yRzVmX5WmnSQJ0A:9 a=ukwt756SXJsA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010078

On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> On 26-08-30 14:56:15, Jason Pettit wrote:
> > +&usb_hs_phy {
> > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > +
>
> No redriver?

There is no redriver in this case since this USB is an internal
connection to the USB camera module.
