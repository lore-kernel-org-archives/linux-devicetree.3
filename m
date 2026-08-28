Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471C3B1BD
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922963; cv=none; b=kgHsrVHOXnxHfpQaOzj/pU49o1aOTSr5RVrcR+/blZ04kNe2g8NIDxT8dmO3BR46MjV7+5A/OL3idZJLOys6YUvDloVS/1IcOn5zK/QTeJfJpkWcEgwCTBIH8/GonmiHpYkBJgGotYudrpO0W3opgRzQZGVvYlz6s5FHEraGu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922963; c=relaxed/simple;
	bh=2Zx9yqyTqxl13VnoZtyz8hCPm3+mqxaI2mjb2ljqRp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MazAotjxSAWPq8qC+xxYC8bY/sZfi/koZ1B20UzH5vQwltE387m4eJEOkrQchh2YLhBTYJFwuiMlWQMCXKNkUGTXMqgspCfRhK2ReUo+gVPK/kpMhhoLZdAgijRXS0y99+K2kMOnS134DQn1kRm8LuBat7JbEXlJxsfrSt1Sssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoY+uzA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiRewxHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoY+uzA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiRewxHD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCb4Yb1906666
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=; b=IoY+uzA7jwVCyC4X
	S/z2Ewqylvtn/n+wr25cFL5D7Kk1Cm6x2BsMWAGjMaVwhJtKR/Ukvc2nX38Eixfj
	1ufWUrdYysx9ghoC9JGaHhtx9nR57fj6i3az8V6RA7RDVIrpiaI492GMDxrFb2mp
	C9+c/QVH5P5N5EWckjR5hRTyOewIvWl207pPyIYGM7drsG+mg3yTnlP4M0LctF90
	4mEt2LJZxillyMpWM/5FOs7Rj8GrrOAsRi014WCMt6zgS5jcSQf3N8aMVVb+wyxD
	pFtQLMy7Bjij73eo23/bUUMtZaO+3ifcwSTC1Yp1WWEji2zqJBosRmm6DIEbydzT
	wGsU9g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r443-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:16:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7674812ca4bso17064137.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922959; x=1788527759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=AiRewxHDNjAvE9bdYQ9sjFo5exuz0w8IFtBBJOk9ZnFAPpkvh4k3jwi70dZKZuL406
         PzymRvcs/wfG+wk6GY4IGTf9dLFt7dBm63lEQ1e/AGklbxWX07BVuBH0T2/WB+1Vqicq
         l4I/8la+xkAk6AvhEliPobKfq2+cZZ3qIhYIhAFXyuXLhsKiz166oblJzVnc1jdJ4yut
         jBgx6xzkKn+gqbSV1lKi2J4+cmrcUQtC0lpl+r51810AsptqC4O/cJUld5ChaXkZIuyI
         5BJcxHTI+hQOGjS7/w9oisj+fW/XQdglx6jXgcOT60Am+wGW0UdM5SYO8Aix4XSPGR3o
         PoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922959; x=1788527759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=eAJoc1mzwB6bgaIk5FjIP5PY7wPdqPxbYEQ8tGpqPJ+oirKBytpbOcuMaz3a9Xna6m
         Dh1I+1Btqr6dH+Jd8Vh7Pkp72d6tkIQIH4BV8H605lVbsrCt4JFEjFJ/9p86csLaxl+L
         BQnwD/+L4Bnq1rR6x5XTlA5qq8K/bZB0HlxIcEKO4uopZNlRtBdw9nJoGK68MPwh4wCt
         tgICw4Dqd8Wl0nkuqB8x+me4702Jo6llAfcojQsNDKzzO0FXSQf8SEc+HMDut7AIQ74X
         gd8vkK4kji4/ROsudeqGs4nxodShuRWwztvgWF7eGxQvLy7YNYFnKfaG4WZbEERZ/spV
         VQTw==
X-Forwarded-Encrypted: i=1; AHgh+RqI/0J0JDmwP5Etu0oDsrq8hReVAkUqd1HgOfVT3Cyzo97J5l/Axo0Izel8eSliriIXfW7str3iHo5h@vger.kernel.org
X-Gm-Message-State: AFuF++m3GPuTZExytIbJNIAR1Sp73QGcPbtuaZyVkoIz/Vr03LYDy3Q4
	XdGtU2/7tHXuTZrPGJE48NFhZPv/ma3q5h8ELY3YWPAwo9sejiHWkNFzUSA7PBglKbaHJmtB67X
	3+lPgr0q4hRH/cBMqjJ1BHHJ4NCk4AfH+lnoFT0OJaz7AOkJP8Fe+oSpcajvqOFsoxpBztqHZ
X-Gm-Gg: AR+sD10XPyNA91Nuvv6YklVWJI7lv3R8LhVYlFMmK3lN03mOlpTVH7v1z2NQNyTHkvM
	B+QdZb8IymXKQgmZvKjQe1YvIwLf8B5B5cVUquC1EZeO/lMoHINVsOOY9N0RS41UlolT7Xm+8fQ
	3nYOJ2lQAr1BnOss++ENkZFSK2a5Ti6G/Yy4+KMcB+04e2DcGxGac3AXIe+ZLV062zQQ8/y0fqn
	vatsBkN5lJT36YG6rc7LUHiFqejxGuTJHnJhmwGVCyXfn01Z4LvueAw3n9oGUEO881ZuL9WQqJa
	S/JV08XUidOQNAxrLejZupg9R+DgBrBnyA1e6DnFGcjYFgVHia3lfLlJEhtrul19bKPHIGwPZdv
	JV3tDSpQOW9OD2QzZSCDSXG4=
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088508e0c.0.1787922959074;
        Fri, 28 Aug 2026 06:15:59 -0700 (PDT)
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088480e0c.0.1787922958564;
        Fri, 28 Aug 2026 06:15:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c5dsm79123566b.8.2026.08.28.06.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:57 -0700 (PDT)
Message-ID: <8538dbfb-ad89-419d-90b4-4e92c2cde3d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918a11 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX1qrQxk5TRcyj
 lIdafbJWyPWOknm94dnOb58WKxs6XIxWv2g3pzBga6pS5GtuTd23BGiGilr0zC3f/XA525AivTr
 nI4cnl8GuaAESMV6o5oZMZzhnsTOvpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX3f0lZzvr6wcJ
 MUWei1KsJXTpSyl+9/HklM+3HJmTGQ31wC5GjimgxDUTijOTKNTk2KE2ad8HS61rm6AMpEVua7L
 DwzfiuR2gBhARnFUus9YXc6db7UGV81aHsHwu12jtvneLDOJl7qhWuQwCXWYBVrFSXmUTF1AYFm
 grPAOPng5uO792SG4+OTMkfUaZPV5/wCrGIHgQP+Q7VqPwOzSuVJd1RLr819KmJJwtJNQtKmpoK
 X7GaMRcby4hG2u1olmvPFvFx4pHHZf3VkVK2f3de98/NnXh6D5CitR+ggFOPxP9cjOQeX0zdBpn
 Dtz7rA71goPrnwuUAg5VJNOcBnhtvbVc1bttg6vq9TaziqWEGoD75l4W7XtCoieQgPrxkkrozsf
 IDhWR0LoeYiKRpfiC0r1aLYzhAULRMUusCWyNQvddtxUI+F4mIs6UlAHYWGUdxqNfBir5+jYuXQ
 9Mtk3ZplEHvkGQUNhBg==
X-Proofpoint-ORIG-GUID: U_FmNg3QxiwpKaG6bp1TYZDO7W0DZmP-
X-Proofpoint-GUID: U_FmNg3QxiwpKaG6bp1TYZDO7W0DZmP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
