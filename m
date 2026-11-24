Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537089;
	b=oc5MI46dxoZTFOcqeRBuWY96xEFcBZBzbBp61AzbdF+lPmpYkVgDZuC8xXEIGDJvLTlw
	 2cP71GpevSeP9LQhGehQaC18Pc7KRNvB7Snv2BawqqaddxzdlY+3q3copDUi0Be+FIGz/
	 O4lh4rIqUDIkLN1xyF+1h9w6xdxkgBqfmU0HrQicyhaCkadPl7+Kka+06ph4fKAhk8HPV
	 83GLGufJFWMsx/jDcNE7LzFlKjBOIU4PjpKwskS43oHONvMn0e1rA9+IywkFa6TBl7QH0
	 mpY1mvElcFnCpSBq12y/RmGEnVrcHH8wQBvx3brt8v3XQGF9Gr369NrGcygDK31YwTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
	b=AcNbEad1PyoQGomnMgS5edfEgtg4Ey9yS97IVciqyIWzgUfx+sSDSgo2/O+iTuj3PKmS
	 QKz6SOjKCsBwSQOLJ4W9dE5la8BD6dP/QTONdGhhIqoZzU+rULGSG/6qrj3UcbaUk2zOg
	 Qezylunq7fjs+NygJTO4o9Jbbimtr2zWvPeJHeiUkv+vllrSYjOVej5ccf9kS/KWJQh2d
	 neE60dHszywV7l87ARsUsupOuwsFXFS6/93MNIxSatFz1X9VjtfpvAxjBFaMUH9HQoLco
	 y3yvSxz66xpLCy+l4OKQT30VdCLvuDSWxd2FsoED58xtSXoogTUyh7NLeL7peODn7vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4E606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B4E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKeN2570478
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=; b=Y1zxCyTGpAvkZ6NB
	xly8DrIW5LJjXev3qtS2NiGeIjjmoVTHcPTjAvLPJNiUDTUKMtL4h5jmBnBcA60S
	+UoIMuTMTLAs8SA10xb2pgX71vUHZqrC1zGkyLpTjZpwrmyP6mrURDicTTvEI9cY
	uheYfkwHhs9xWxsY0bbwjPfKhSWT383YS+0Um9mGomRiuZl+H34+pgfDRdNTksKz
	M+2JpjkUGcxEFVbLEUw8eEyMuWjqwq2mY17exIE4eX8W/jJqXlaFICAsgNzyizZZ
	lwhZNKoDNXpv8I3rDtkSg3tTb3ZfWTJAD7vZZ2xD/SqVt1/mKCXr0x/iNqCfrxhy
	y3HLlQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6svakm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:18:07 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4cc42ac12so58774697b3.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537087; x=1796141887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=UPNn0e7iXFww84wu5/gMpinOU/gTOsk4g7GNXMgY2zxy+JN8DBqMuyO3ZTHZPiMCIy
         4zqs6t46U8+ayDhnlpe/2o48qErfVe8tsIS4xOSQQDiYeCmtpbNyN/CO0M3QlRcN4BVo
         CRKRLtLg8+Mdc0wu4o0ini7OrIxD6fthYm012jgdvx7+NyBonGchVvk+AR29Mjr+yDHt
         0s4y9/zVKr51jZhss8WDWsHQtvxMR6H9txoOrj3X5l4uwWbFJLa5+tsdJLB4/mOADel4
         2C+EMm9Ep/RijmyS+Sbkhpb/8uRoxGU7POQj09FTxeJT4MgvYjWFVMngXyKuBCZk737s
         ZRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537087; x=1796141887;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=g4uuE4NhPchu8B0sopeMXMjeqR0DXVxisHxdRirLEmgYxVSnhykdtgNEmI3CXanyEE
         gsN4czb9kKwm5ubm3xtFPmPyyDmiHpkfhbP57piQfAxe9IOMJSEd27bgDfxrE93ee0+I
         X/FhROVvZyuj/WMS66nYwbvl9eCnclQDIhHbMOIZbiTJFJ1AQceNDgwzLAMwrdPoD+ts
         cLHKw5OayVGIuruRcv7CLWpXxTXQcULCq7JBtwTfHCXXO7Fde3MmXBazfeXgW4Iql4BP
         2Iv2gmQjP0EXuLhZP97mokwj/UDkfs073dJNd6rtsN4DQPIzE0tMbrWQJtopcpwd6n1X
         uZtQ==
X-Forwarded-Encrypted: i=1; AL+hErHwCt34ozaqR5X4Z52nW3ZUVRg21je1NUBvTL8ykpFwXajo7jtOK/Nm+NiccUe+hBKiN8ihw1sAZebr@vger.kernel.org
X-Gm-Message-State: APuU4Z+4qsgEkMBQgQ47SL08+ONMjcxYX0+fP1X0eWAdWxnNmaXyzd/z
	7qVWu+iRZbBypFxtzhTmjMhul2Z+QbJPeWIvdFg8WVNWDRF20r+M2v+ppgwFGdayVfE5UqOzYCd
	pw2eGCjJCniQ9mEOnOIPUrLJPxosoYZiGXM4WY3nnIDAvWUfgZ5pADAod4OCf3DxT
X-Gm-Gg: AZFdTZfq7n2wMYcU2n1fRFlpzq28IF9yTyxvMEiS7GTT57PuHTTWqpv+Z4kOP50LY91
	qrJ4AISgEFEt5BDcTtsYGvPB+QxzqaN+7WqajSLsC8jiQ/n01RjjhuVfx2LUsjmZHQWvlFXTkkI
	JKWeah7/6diil62Wvqw8vfhumSWUmwDtvZmPhWis0DtPMp5fJzXMKugfIfo70Maqt6zxjARjZRV
	T6sImzmPbJa2K3ix8Ml1ohnGBPv3IegpldkdufvuaEDqBrTuN43fV6Wp1pZrfTCyzMujBlNfgtp
	UFoPE+vmzI9cTdVPJXcjP+uCN6+6oIirdgdSMRIWux6xA9+xI3M5detequhJARNLcfpPmT3+YAL
	r+eMfQ179bZ8fU9ASgi1/RDvAvkfwbWXk70xkXswydfD9a3j86KdCN+aajPzYOVSdpasNboBrt3
	8omzkjMonGpX0jw3y/ZpAnAIYGn5uyJn5+PReGaY6R+tcx
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603787b3.1.1795537086922;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603667b3.1.1795537086440;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
Received: from x2e.localdomain (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm58578567b3.34.2026.11.24.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:18:05 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
In-Reply-To: =?utf-8?q?=3Cd92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517?=
 =?utf-8?q?711=2Egit=2Eyadu=2Emg=40oss=2Equalcomm=2Ecom=3E?=
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> =?utf-8?q?=3Cd92?=
 =?utf-8?q?391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517711=2Egit=2Eyadu?=
 =?utf-8?q?=2Emg=40oss=2Equalcomm=2Ecom=3E?=
Date: Tue, 24 Nov 2026 16:18:04 -0000
Message-ID: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: qr_abEzU9jzIVVWyKzUGta-DSTAZsNmu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX9DNP67nXp7kZ
 QTUNne+unV3OLg6rhCecBZC2xjq/oYwpREGQdOMJ2GcXRduW0NAufP4qrA9xp63yOKVPhxbFurn
 VrRsaWaDxK9F4WajyZlLLwroAn0CHu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX7E/lOxRYPs2H
 ClbFeUZH9QiIgiinOKlbDMDwQHcCQdSZfNkbss4dm1ZPGkv6jVDqtlnrJ9d8xQryvZEXAKJQUXY
 fL3Bxfg4YXi834DREf8Zz/jNf4mTv2WsXQURO7+4aES2i//7OYcsJUYQJhy0e9JmYQwoRx4S6La
 tEj5rIGPPyQ/BlLL8ecmxIPaCmS9SjZvSLxOBw3/c4hjBPztgbUTnq3wlDilbaN+49H0uFmLSJw
 EpyYJ6ksnJvJzT8VLd3i3TCr3F6G78/zb7AIoeR8DUlYreBkQtN33nb885jGmVwhI0m+VvVaDsr
 Iz8/nJvXoLEZJnj334IiH8WH+ZrQP+BKL5gdiAhqKb249Up27EoY2ZBEqmrbb4MOgLh/tRvNNGx
 OZh1jASdqvj5EWbYbowL03v6RqSzKSInRxOn02UtkV9+uIb1/ZGJIILr1kkyoxSHXN1gx5sN/CX
 wxHe8X2ipvpmpWcyg4g==
X-Proofpoint-ORIG-GUID: qr_abEzU9jzIVVWyKzUGta-DSTAZsNmu
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05b8bf cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fLBBdKZWtF1Qa5PrkOoA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240063

> +				arm,psci-suspend-param = <0x0200c353>;

On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
the board ~2 s into boot, on the first few requests for the state.
0x02000153 works; the firmware rejects the other variants.
The downstream Android kernel boots with cpuidle.off=1, so it never
hits this.

Is 0x0200c353 supported for the OS here? If not, use 0x02000153.
