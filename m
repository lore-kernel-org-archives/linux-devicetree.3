Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702164;
	b=xj3XDaU9B0mzI/ruDj+Xs2WJgdmdhZJSMgq8OR04RmG0nyLvL8tNGHA2GDwMvefUFTzW
	 6eidpCBuy2LD7ooX1nBZBlptxnSj2awV9HQO9zPYbTmVcIHhNPGe7NBiF7XaJeg0LhlsA
	 5bF9R5i3es8zn0MuTpeA7cZOeojYAeN04cKLYw/aEcX00pBzIZGHwFGKGbb6Eu1AD5/t5
	 HTZA98laRCUrBPl4yRdgB2Ot5diXVF9PSWqb2TEyTW96QWTJBKOrQVUqDoAz+uf2fS6+Y
	 9TyAFEN8g80vISrqcKbihOoPlE+7e4oEQttL/X87m0C92hptLbtfSIhFfqIjfcBqW+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
	b=QTZMxFDLnKOxq7mcXvFVnFcCF9qcP68gS+XaAe5BeXb1x5565s/DtaE3sF+6ODLfdWUP
	 JVc5coVQpUeMr5gKG5Kg4psjRcQJyK08vz0VAuWTNVg8DK7vdGXn3em7H6NJmP3aVwav7
	 kUp9TiahWQUN0NXXteys75H0R8r+h1ziVJitXxACiQi9mxHGn+hb9tyrrTEiHbnWEpfJ9
	 0aIEYmc7RIqIFwsjD1vB6zIEwjL0+snNo2x8iICR0kIbPhu245bPtkR30xEuvdJ6no24j
	 +eHptB4P4Pyskbrykf5R1ch0kz6t6+x6/b+xhr/kOCt/XFiP0iWzaOBiF7u2SEMI8uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJRFr41n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PO4CtUCA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA79606FAE3
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA79606FAE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJRFr41n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PO4CtUCA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAVbR2201894
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 10:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N4mxJ0Y2k5Qh49aihQ4X/Z
	oRxoT90NExmpfeJitopTE=; b=SJRFr41nDTEAa8Vd+01B8axC5RAJQUezRdR+gJ
	ErRBUscEfRFBr3ag0txwWmyOKylWngykDi6su0Jy1A7EQkK4DsSTYdD0PcfAlU4j
	K/E2FCB7ZuB7A02hy3gsYS5q986fWE5u68lPF3XZkFdIBnrlVo/IFGipMSdIdrgt
	XZu1qW8HZxztlJSgnwrlfPHxC6R8qPIPG+qXONcv/JoOrBG885JequIWTTjuZiGy
	13B8xt4Jm40gbOEcE5RZ5+XZoPXDTSGxPOfW2PlA2ZT2cKTy+aiwWl7o5v9y69Aq
	c74BBEqUGLst2X9zJSP3khSoJtIYLGAWfFvhzkkFAHUDjzFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3a2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:36:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so552242785a.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702162; x=1794306962; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
        b=PO4CtUCAWYz9x0l41AkTVMP7J1d7cdREGuDUhJYWySBLATbxi293sXoXfvUtJzVlV3
         CoWM+4QtBYA1t80JX4qWMA0/uVZWBYabKza86txWPXyHq7URMazne2PcvdTk31AEbj3E
         oEXoAznai9SsfR99/cMbRzGoJXO3X7cwxN64UTCYLYjAE9KW/6XYipMI/eMzGJYQFLJU
         Bp17v6mmnfjUyRZQuEgVza3EMKze0nKkXZ414bN1MtnVLbKpSKzJiog0bVkfBbsGn8ZD
         65eiVUI2yrzc8ivDePbVLCk0jXSVSLTwI/iHxnNyv+AncGAbA4a826hDgzppB4CQBNon
         fWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702162; x=1794306962;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
        b=cQzG2jR1v8khUshoqA7KwD8OFtyp5wQ1zV9pmh4255IrNHxillq/nN2tYso5JbjLw+
         1cxfiuIrc6xOfjWMh7hCD+bhW2NJgAoe1Q+JUZEqmbBbNYUx/LHQQ1jyPXDA1hx02peO
         plD7x3yLhml/Grznt9F9i72I/oFtwUE0P9zFY0pWmJBzyNlNK4B6Q96+TpcZqh7/ALDY
         BO94oa1/MruCRNGAPyyW7HO6Qj/d874h6LSB/qmeYpR2Vo4K9rHdmtmqccJT97mKk8j0
         eMarhxd501Hcpf/ZGYppxeRwSmN1R339YLWiYbI8FNepQDxyHqDGvYgKvCbpEtrBpjcs
         rJDg==
X-Forwarded-Encrypted: i=1; AKwUvBzk6hxgCELPwn9DJ5cQgJE5blNy4asL0ypz3755DuENA291fc0HexJmNriMTDQ9vuyzdWyqeuPZ4mqU@vger.kernel.org
X-Gm-Message-State: APuU4Z+quIDmb75xagGBqN2xAx88ITskcd2VEroiqJ/0thtiheCs2WX8
	cKPw9OYO4O+9avNjK2wiKLd/UR1AQWBrAYQc1UXGMK5kp2yMwvxfKdNbvRhXnGSqUJCowJFwoE9
	hZWrO9YmhelCdwpe7cDTISHCf2RGMahvCkrxKQPKYYG1C5oCJBS4OYJe2tj6Kmnk2
X-Gm-Gg: AYBFou0Bugzhm7/2lRtmg7z/uihS3B/008k1H4VVwIfmRjtM+SdLSdeBt4gEeHjCb0M
	5Z17eTQShi0OpPs3ZXKADgH0zMR1zpy5Tww1YPiyk8vkM57Q0CK4n4jZnO4t41rfRMO0vLEeX/1
	Q8EaagznsRp8XYaNpp1t0nPsJtmeYQtYkFZ3vK2lmKQDs6hcQBSLqqURKIlq2RoqydHxaGrTPes
	8yKaUhZD3p1DkREtNMAy8izSHF3sx9vh5n9rG7FPTMSIUCF1njh8QsO5v8wCB/x6ALIp6grL8Ew
	NJ6J/QP4rcxsVxCayCQSNF5T1R3vi6mSdY8hwPwP0H99FTI+oJoaR1ytOCqKYoP0/8K0ckNshOu
	NY8nKTkz3trinPd3OkM+5OlTD6Zx2I1rlG0XKhMOihc8qPQ7DixifowM5Jre0p0KXiviHcZwm+A
	EiRw==
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id af79cd13be357-9442174703bmr2045665985a.67.1793702161460;
        Tue, 03 Nov 2026 02:36:01 -0800 (PST)
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id af79cd13be357-9442174703bmr2045664385a.67.1793702161005;
        Tue, 03 Nov 2026 02:36:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm55210015e9.1.2026.11.03.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:36:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v18 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Date: Tue, 03 Nov 2026 11:35:51 +0100
Message-Id: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAe56WoC/23OwQ6CMAwG4FchOzuyDjc2T76H8dDg5pYIww2Jh
 PDuDmLiQS5N/qb92pkkE71J5FTMJJrRJx+6HEAdCtI47O6G+ltuEM64BMY4Tai4ED01g6O9m6h
 EJrW2WmGNJG/10Vj/3sjLNWfn0xDitF0YQa7tLwbHPywPUEZlBcxiI7hR4hxSKp8vfDShbctcy
 IqOUP8g2PkqD2QIESpluQaObAdaluUDBon6QgEBAAA=
X-Change-ID: 20261002-sa8255p-eth-phy-6a0699f98a7a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5985;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OSH/nSegAY4/sUehIxakgb1AuxxbhMkC5070iHnGOGQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bkO/tSQu31z/oZTDK3/mEWEb8wNRfecbFn9R
 Do3qyMqmkOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum5DgAKCRAFnS7L/zaE
 w4MvEACb8Fq90GKKmgqJLWoeI59fXDlpFqVmQWUxutTSnpvWY1QWhJc2cyXGuU+Kv+PizTVr4Ot
 h1RRFaSzPVAUK1N2xcLAUIm5yYBQ5fr3GFNAmUfjK+8A/gGKl/GH0cejAMmyDVWxV8LG58xTm5N
 6D60t6LSnC4DMZgBGlxT+k0vl+RUfYcA9DjUY2UdMwvMvF8DseO+HxRHCOW909Dt+tlNdkAfl0W
 rwvIFqDK+mPmi1E1TzQj5NTKqsbPqQDQlOk+rb/oaDV8fyvBF/OVxi9bKKosx2NPEwT3zNdZchw
 yS4cb6hoeLBgg0ba1TsAzTmzu/SbQ6rYYH2vHBfXOTLTXwstwpk9qBud3k41+QdYCcAFeR2+u63
 SrDco4OC/mWZbqZnaaa4XvK4wvW4xbFykmWLTjZ9YdJSyx6YO5kqG22nQ/KaUsi4omBXDN8ZjyQ
 bF/n8AWZKscJAHs6eVRHrxz9rJ0mvManvzVgiYm5WnswFKhERvpukybGstnST8YIuTR0VdqrLTQ
 LYQ9uwoZzw5x5E5e11II3F0Q20CDAQYW3nYXCcs2i5k/DPr+YzaedulZdlGwXS4cRPx9dNxDjjR
 sTSBElDF/pVa5wJFr5OoMnXE8YG0QhkHQkDge6ucrp1rzdB7brw41pxQJyweKqAXrcZo/+cszGS
 weuxSC9A+0HWwyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 4dMH05bbDvUQnwDpC6aUZwNpFvWoLnAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX/elcvdhfx9w5
 zEP8B9ymBRVrFikpverOVUaMuzOO3YT4TrqVcPWgvqHEAXw3AUBkjhdS5g/sMjuaZz4MPNctLQw
 cI/wkegtZorjOfD9xHmG8ltViipPlvPiqyEpDDm3NFrkO9MvG3p4dQYIu+RnbmwOEXczHvHRtA6
 RlmH/O33YA3saMQ1vvEOdUFpiroFCUFaeBkJapPpgZluKLBAl3WVdFVY6PrPSXqyCVBfLHbmgEo
 Belc6CfTHnnp+UQFR5tqjQfMOP/4SNQ2mIhPIgMb6wLnEavAz5zs7GeWXon0+/9sG1PFimg0Cn5
 MFh7laiLAdrrqmYZQQ9FsuM7h3BpWMmgPzI+wFl/H/7tkpBmr4WBjpjNRrPpEYfsAtcdremRStp
 gOmEoCgDic8yy9+25RZR20vJ0NB6jtbQ2H+5swXMIpVcQbM66SwoKThJMS7y+vSy+V5syS/MVoX
 2/eA0lmNef4z3wE4BiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX5gQfCyZiCA/v
 LsEaki5PpcPT3BDfJiEJEFQMqjCnBMb/W1awybz3e4NrHW6mPEQq9RwDeUYdjyOopIgy7qu+Iks
 Mr9V5xpfsC2koyycU0wSZ/j09K5W0tc=
X-Proofpoint-GUID: 4dMH05bbDvUQnwDpC6aUZwNpFvWoLnAB
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9b912 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=ETV7lutk0qaDVqJI:21 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

Vinod: Sorry for the noise but sashiko pointed out I forgot about one
comment from Krzysztof. This still should be good to go, there were no
more sashiko comments and this is just a rebase + a commit message tweak.

Add support for the firmware-managed variant of the Serdes PHY present
on the Qualcomm sa8255p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v18:
- Drop power-domain-names (Krzysztof)
- Link to v17: https://patch.msgid.link/20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com

Changes in v17:
- Extended the commit message for patch 2 (Manivannan)
- Rebased on top of v7.4-rc1
- Link to v16: https://patch.msgid.link/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com

Changes in v16:
- Split out the PHY patches into a separate series
- Set the SerDes line rate through the OPP API
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (2):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  45 ++++++++
 drivers/phy/qualcomm/Kconfig                       |  11 ++
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 113 +++++++++++++++++++++
 4 files changed, 170 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261002-sa8255p-eth-phy-6a0699f98a7a

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

