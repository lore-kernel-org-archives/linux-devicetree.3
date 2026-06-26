Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1B3F2109
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473268; cv=none; b=om9MDjeqRe87wFDl/PhLdy+qPYZDTAwsDFJRrXB8idS4Q1zpfY+MmC9uK3+T9SbmfjsbT2QrlF7kNA8rcFa2AX5X4rv2MrT9Y9d1uBuflTeyCsL9jL6c9/JrCzHObMKUdNU+YsqOnQDtO+A1Pii8ZDn/TrALfTnup5UGYQao3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473268; c=relaxed/simple;
	bh=e1chsu+V2sXtpThe9ogQKDBaGShzDBEsNcW0KWQp9+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZilAzHSr5+xBHUGTrnyWqOqOiHiBSW9aCIl1GeD4ESvSLbcdjhrZtprUJ0Qs6lilgfLq1bGSfrxXghtOq7SeQKrIfqOrX22NAeS2G197br9jwnlaFOZOLbnALjHnEa9sPQUbn4Y3Iw/1GqW7LstoyZE9DrrAdVJnIt+2CqsOmRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxUbdcYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWCczQTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxUbdcYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWCczQTL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAeRp01073762
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=; b=HxUbdcYNcFaXSwQR
	cJ8McPaFsqPO6UhUrK+sb11jzz6tzNySCVhcXWWoGMUDJMb0ucvdekPk1p5xU9TX
	g3LSEAv+e3J32gGv4xS2DVvPiMPxhjxJ5AtXIs54czj+f7Zg1a1IRV0kKvmVfYqf
	fW5cvWvYYJfRHNIFBGCJ+7EaLJtDEeVyizsu8gl3SFebYCkkZaP6/R5PMcKFdyI/
	xvXy8MBdM7S3ZKSenQr21jtI/S3OTXPCU1CjfJ5/Nr6xj8jQvwYIeXRltife6aRH
	up81CCE8NdlhEW11V+ToymiszuVd7oa3w9vRxds95/1kOj6yqSx0I1pOFPVfyJAM
	eYLnDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fcta43s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so24845785a.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473265; x=1783078065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=;
        b=GWCczQTLl/VVREhPH7aCktgqhkVNOBkcF3b45Th+ZVgipcxMNWzQKORc33qUbmO4Bd
         V4WrR0aFpPLwXZ6XW+npFPEFCLSsCTBvTSTtkC0TV+WeUUpifaqq63qR4qaW0POLxWe0
         4tRVNpwXK5gUV+ZMxo/R6Unn05wSLcauQenVZj/4vRaLZcENtIhxBFhAFL6gb7Ys1bwH
         iIGoaR9lsfbGZPqVrQI7JAFfJQNffs7e3OSsOTNLlvccpYOekye8rlpFoR+Ak5hV6OJY
         bCgiQzn+2ofnrnoq0czY6WTKkT66AlMn5lk6C4CyJB5pOS4/u7bm0IoKXuSaE7+85Cz3
         O/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473265; x=1783078065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=;
        b=oFnfq/4dUTwnCYl0XRirY7IzPqlwXb7oKaeXMKa4nKizAyPLjyC9paGfE76DJW68Ah
         xEHD8SavHloETxQ/TM5WG6NJONB9GWmKoiBSA6tRniyaV1wAZ41226GR+/1qI9t4Wb35
         MZyIk/44MQDdks6pvTmI43wum01zuIunm+gp7dHH+1U0kMeJInqbwAoMWq8Di0csXZRD
         YnMtiEbcl19KYkXxqmohC46DqDI7QT4VsnT51POEYHHRQlGPRpKrzXcU9nX8kQwzWyQg
         cN+46IGrO/y/foH73f9BZdVGts/pCMrMjR9ZPN2B4zWOwz3VBDh6zSeMVanKOdbCULNg
         z05g==
X-Forwarded-Encrypted: i=1; AFNElJ8H3mb1M5cXKNHa0h8vYy2TrOBLJOX9glcqmpZV82v6ouprfrVO9YGqBTfzFzTG04kK4h/TE20/juhy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81qoMLY38NYtZjQXTMnenDtE2SomJaGB+tRLhCOM4IDD1R6Sd
	mRbH+rsujPH7eQ08XO5XX+m03smHTchoQwWjTa0/EfIxQXyzWIx7Z6CcsQzQAfddu+cX/a3Tll8
	i9Liv69l0ReNp5ayw17Dh1Gb7XUWclr3QoBGbwvqjkES1erXTcR0DOLqF5fAfX4hpRpqj/XcZ
X-Gm-Gg: AfdE7clCP8y310N23dc6FoaL3uOS/CAuhUP99REDdkMKMupfDrx03gvlBEqCucSnO8E
	zByjy9DOUu8n+S6OAKoYPEFDxMZiYudpGWUhQ0lt567a1ynZQmdJghyzqpImrqEpxvRwxQ4QlWO
	0TWohDp1s7/tqLgB0pj762wimqqizh/qtJZ5eFjG8mYprHHZcjslOIRL73fTDiReSIxszHCo6oi
	pGbt6hh6WdbVBpsLvUBXH8DP5E/nx+wuYxMt3nSrfQEqbLCmjENpKiEMCbo3j5sr7KEqBCNfT2u
	d3DzZ7iqJtAsmc1s0VM7fZeMaKjL2GprymXHcr0c8NHp0vtnNsR3L0wO1zX509QHqgNfZUY8F5M
	gqqfehRgkZ2DDL9ORsxwL3nm37uJErRsXPfI=
X-Received: by 2002:ac8:7f85:0:b0:517:6a56:accf with SMTP id d75a77b69052e-51a7272d4c3mr60815501cf.1.1782473265546;
        Fri, 26 Jun 2026 04:27:45 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:517:6a56:accf with SMTP id d75a77b69052e-51a7272d4c3mr60815231cf.1.1782473265060;
        Fri, 26 Jun 2026 04:27:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121af5b525sm136978666b.46.2026.06.26.04.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:27:44 -0700 (PDT)
Message-ID: <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:27:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3diWifncBKHhV5_zZ2MDWRYtZ6FAwpyf
X-Proofpoint-ORIG-GUID: 3diWifncBKHhV5_zZ2MDWRYtZ6FAwpyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX6pD8nZe7CZDN
 IODQegNGm3v4dsjFuSWGLB/n+cDbWO0EZXx/+Uk/1+AgBbVRDLbS7p0Y9T00Tpn9VXn01LVFZ8Y
 A/PlD0Ys4E1AEc+Pz8qebIlVRlt8vNZ4Sz38l8nxne3eCReLqAX6iqEEdXOandW4k4jP7NN0Y7L
 46FxeBtQE/1InBPX5Hy18SnvOmHjJxshNehAVun4T2WkYMx8+P5UOWMoI1E2Aw4o/C0NXUegDd5
 m5F4V09OTqzemTgAJ7tVW51bY+siiqhcfQdoGoR6G903ci9K2I8K9wbk8kByn6qKUxZv07xgoSC
 nskJuZi/753soOsjIgA100Xc/1sErs1rJzwedWtUgAisGznwElmbCCeOVeZhc3PGoVHZkGWdFru
 14cFsK6TRR5U9mXIJJCJgxAaqmcNBE0zWGJwR7prbNmedr86TJpPM7/XMbriXEiELSqy4nvuvMY
 3DCdlLOa7NCiFPueH/A==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e6232 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IGK3VjdbSyDGhnJX_5YA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX/DtowMm3Q+jJ
 7lv5/DMbwJEmRBtKK8EPIHlfd4ZesHx4GAUluQ/AivJo8cZdG9goORIXGOlX7jZQek5kcJK8nlB
 +nYXhzM79RT9xfMRwdVu3MmWSvhWErI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260092

On 6/26/26 7:47 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.

[...]

> +/*
> + * usb_2 is not exposed as a connector; its combo-PHY's DP lanes drive the
> + * chassis HDMI bridge (see hdmi-bridge).
> + */
> +&usb_2 {
> +	maximum-speed = "high-speed";
> +
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};

If you remove these two nodes, the QMPPHY-as-DP-only should still
function (it's the USB3 block that depends on the QMPPHY, not the
other way around)

Konrad
