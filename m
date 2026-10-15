Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684FC51D524
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066455; cv=none; b=cHmmPMyMKRTyaaJ/qHNf4IWZ9skZh8p/dZrKPnS+V8tlVWymhoqS+ZoEY8+RzuaQQwMbMmp+jdr4ZlzKWgKOcVZpfzi28aJOHifAN/IPCZ5d4S9arXMv933qdCq06qOU5bJxMy5ncgOXOSZ4uloD+cGvghPkFDas7pJ6d0USuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066455; c=relaxed/simple;
	bh=HMD/MqislT+ok015FjFOa4vw40MW8NG2ykoeJZWTAjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMjAibWho8dr2f+lJL9I47u8h2DdJf86t8GkUtJwYh33ifFn4m60Yk36tm0pxHkzoYWxdQSjuM8UND5+MQ8f7KNo+lADtHEonUG4ETVyeojm4QKM1cZGvYUBbdtTUpE4IIahSfv4O6TAmluAJbG6ICRU3+/arFcJEkQr4LwWYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/1PJQJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRUNu5l+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/1PJQJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRUNu5l+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kKQL2999352
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=; b=R/1PJQJVIj5pxKc2
	9ReaE1zVz0yl13E4DPBOQjRdtmxFfS6Nm2d7i65Au35ba6qCBoMPyvcOiGC80SdP
	CjkO0zKgQDdI48NGL1JtymOvqxaW+/5yf99LruTdh+P1UX8Zdl+Ch2K7A/B/STrJ
	BBIJ20KsdqDCn54sJDoFKvPlv75k5tLgrR1JlNwmJO1cCL9c0TYZAvaDhBp0um5n
	Ah6A1Mj39TMqKrDQvcn5f//MSpuVMaBUhXGJ5qLbVDosbRNF9K4UdNNshanx+EaA
	Zk6SNgYXqNKZzYdrp7ZjwfpTEJ9FruoOjTedaqwLJ2MUIbrP5VaV0/nBxLARGFPE
	WnqLxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0umj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:14:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so998685a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066452; x=1792671252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=bRUNu5l+rvR5aRQ3iko9IS26oK94n4opSENCbxOFI9jknUrZnbuZ3oUDPfHIh3gFxa
         vukOl5v+ZS1X4zPH6anYX/xh8mA0KQIKzE87+w+diiscvD/4acqn3Ixlj2hmkf5xmymv
         T70pFSeTQmD4XmZbT3E7J+2Ep/BWSkMvQv5DdOjD9YEWRZf/MiwjsF4agwmpN0vrNoZo
         TUxqy+BrtPK6+3dJ1mRpPEcjjv4GQiIh+skzkCRC4UimLfNTypIp2I0bjU/AXdo+gy+I
         1bScBsFi1vEh094YJo9odoUmxb3E30L1BCsjRXlWjXEq0c+l7PaJpYw8VxJ+hB8931QL
         kiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066452; x=1792671252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=HIGo6iPCdSt5/KgSLmtRiDriiFxHobI66z/u9LKw3AYfT4l+v+eT21N42a+1bei/2Y
         krgbXAx52zsoixgqS0bA0u8xKntNOOdqTCgUMmz6yG1sb8ilAwiXIC/F6xUbmkdwr91F
         9kgzAiqN+a67Z/GdsWg1iJhYyb/LaMboxX1l1eGl5dAoe/lOr86/rohD2Zu+gLPApEtq
         4hpidsExzZOgCoNDUs9NUBPyLjlf41BTXZkSorSN/Ao7ZmP545Jl/S5SLKarruZvts6E
         cLxflmA152Z7murnxD5tGoRGBjtbUlLMKlEcvlJ3wt42qGoG+pMszWDsKUuZw+X0GNnc
         iQNw==
X-Forwarded-Encrypted: i=1; AKwUvBx5FOZNLmQkrHhh8mV0NKfaLc6BYOkgkwxPdnFvObFzyiZqBU66CuNlYUcof0Zd+Pud6qr4R8wt5Q6q@vger.kernel.org
X-Gm-Message-State: AFq9FYIoVfdBB1549Ka9m4unZMl/FdmKiVgfBJYul4EOBhoQ0ftIUJgr
	Yh/nwq3QF/Td9OawBV93g6wqQxSEBgCzaWy+axpg3l98UlDPiuajxO+1mdNaI1Qx+tBHjBx8/Ps
	ZSH9KnwNgwdcNjID6d/ePzuuzAZNE8m7vBZyNEPPLYvoG/vlEf/VYnI/E8u0gKbzJ
X-Gm-Gg: AYBFou0k+kGg8MJUzj1BiM0hAptlvroNkkqpw4FMwIr7fvAPFctQAXCSjWDlbaK8Dk8
	YG/HobV76p1FYdpYsy/9SsoHCvFU576zbVES+62BQzcxWsm1Z/hVOaoqMYawl2coDxBN2Z/9izN
	pOxRrmb/s+5+LiUpsM2vx34uH2s64MNhmKSY3QujR5oERbOyaO3oUANN5M0IC0zFGqcSRuigyKO
	D38f5S5tIZt4TtPgk05+XVLc5dTbcZ448h2QZiKNwE4f+tSYfcfWfYZFlhcTaaD2JPgR+a7sJu4
	VOGpsMCWxG3lLzHO89nzwnoIs+kGuBvPX26BZf2LT18lf6GAj0x2P76+ItI5dQtxrybZxaEcgXW
	o6HaEWuXEvZwf2nGsbmFYeg==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499464785a.5.1792066452511;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499460885a.5.1792066452035;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm116373366b.52.2026.10.15.05.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:14:10 -0700 (PDT)
Message-ID: <95de4517-d8c5-468c-8df8-649827dfc130@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:14:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uTwiYGXqw1yYBljhDyHpoJ3E8pIyHRg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX/98L0wsggnOQ
 gSS8ESly2B0P9n8zCQvkU514XonBGfmT3uFE8ezzLeRCj8HAeNHGi/bEZcHo+jg0DcgrA97aFCs
 Ysru7/3V3LZ9r9RGOXwAnxmTfWc6cy4JxOk7lcsAe2bztHFr/FuM2sW6pyokz8ZdF72tVIh9C0s
 jPHO6XB1MwivJ0KeMvbgPrXm65fN/sggcTieMoN1IG9367t0WXsL+bZJEQfjRVWgenq3o02quPU
 8gBokb1dj1biBwVEL3kKEW+2N8NwAkcev9by22CWqrLGuOwsKtAi+ERbBD+E69gE8eze61fWDfD
 XOGez2ynaJyk9KMzbqFcxtf/2/T//r6ApGa6jt3TWxvKH5ytgjJ37hjOvdY0x1WMVnHfkWzwHCz
 lk45PXSPZy5cJyLpd8459iUp63JmKivysRo5QTMEx1DGTrhZKXfwSCBpNEv4KRLiPTNQhQ3I9eK
 0EtT45bYjKbiP0QJHIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXweTf67of10fa
 ufAg94iW4rKihzIqYI9QgbR1l+RTJyW2t/rfMzTnU/g0X6FpA3VN65CroD9O0if3vN9/Fp7HRFf
 qEISnW3eCxkriXFG1CLsw5ytkoBto94=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c395 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YqG07dkmy_oNa1g3t2oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uTwiYGXqw1yYBljhDyHpoJ3E8pIyHRg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 9/10/26 6:36 AM, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> Use the TMM fuel-gauge profile values from the downstream kernel
> (`somc,initial-capacity-uah` and `qcom,max-voltage-uv` on the 4250 mV
> bins). Akari also shipped a BYD cell (3056000 uAh); a single
> simple-battery node cannot express both, so prefer TMM as on the other
> TAMA devices.
> 
> Voltage limits match the fresh 4250 mV profiles: 3.4 V drained and
> 4.245 V fully charged. Aging bins raise max voltage / CC-CV up to
> 4.380 V / 4370 mV and are not modelled here.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
