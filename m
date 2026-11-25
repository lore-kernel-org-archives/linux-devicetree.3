Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601334;
	b=GNkH+O2sfOnFqvsE6AqgtrHX562K1AanomfVgIqDm2Qr2jQUhvPBlSPbiCzO39SIUxhC
	 fXJ1f6x9vmAih2x3p3sFBqHB3ciRhwnHMikwkkfHSRZujRQSsvnLf+kY0cyv8L/tkddVi
	 Q4QieVGz3X1NCzDmSN6enBAM51jmis7jSYEulNB1typaWOc0dI1juN8FiPFUoisv+nPCa
	 aCGgJbPiNt2uNpNMQY97zccwTCraDjCnIP4l2FKWRlQO6xLdSOPXc9ghp4wFlmizXCAV2
	 kA1Ix9oficn19M4hDbMhdKG8UcXPtpJV/kuZPwg7bYUOMJdIZp9Fv9/h+OWJknf/UrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
	b=gW1YUTcFhpCZtB9u/D11IKcAMakk/f9zZItnOTuoVZtdSsBMGNihHkFHRcfX9Nps/G4H
	 f3zFr22ipGSK8m9o0ArIeEjGK+h4qLBgxKfVSihRW9oFRkOmXQl4m4t9KglA8gPh4EHfw
	 wwAMf4YBwM7yZntDjZlNKqRy9P3iHJmdkkmWVXaJkJ3HvNrpyHE3GOHEYQsSypqX4jxvt
	 DYQiGZjRDHe5ljSb+0BjVeLxJiXzv29wQQfH+kJtQSqCZwgDLc741rpzKuRtlW2X3uYOg
	 VGR/8K7dxp+v6m8pKxgeejHXB0u1Fw2GFESn9OYy3YLgY3z68NKnYb5Nb9Z4ratINnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA329606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA329606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mS7g3764057
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=; b=QnrnNWlWhHnupilf
	OCjw8Db2iEHVxnhXqK+UQbGt+FscGxJMWXm49viFDvklzFkquTgNIHQYR/hniIj0
	aNqHINAan7Ipu7luju+b5oSeh7iugs9CqoZ3rHSwgd769VlGPDJ7OQXwX3JXDEqL
	RXxMZvGaRNTBonZb8xbDOyaVYVysKUZBoTtt5TYg6d7qLBk6/YS2YEEceTjO8029
	eVzX20ZA53mierDKMDTf5VsG1F/j26tJ9rNPVY3Th9gjetN0LTofl/o6hWO72HQm
	SxaqH1oKKTq2Z9FtxDqhef0wZCSNz7QAPxWKervOc+lyqwIItkK6u/t1JuixXzSn
	ttpvyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2r8rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so11816111cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601332; x=1796206132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=PEey4Gzhuymafp0uZJvcyRKsYjCvjeRUZAJ+BBZxSiF5H11E0zWd8H2krelTIdn7OS
         I43bsofAUMki+IH7Z8/3UCamrtWKrkREK37+b5wJG8T463jaIzXWDDzuIb6QNZILUyVs
         gBJ6DD2B5D4izEn9tCTJ8KKzRpKwbzqCHJTAotuaRjA6HFCOLFZ5opdjhcM4ZBzg3Rb4
         T6xR/4N8MYgH4a5rfwGhjKFEtHDoWvxOV5SOvFBEUW4sNtgOtgX1FSZi+keRQbAZ+5m9
         sMHT5ZdYsy/6IxzVScYFVBtvWJ3SlCRwMqyIVmuG8S2xfr/rZuKpHvgrWWKweJhGdK+8
         Orfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601332; x=1796206132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=xjThFfS/Zxnl/W5r/7yOMUhJ0Divvv3vHG6E0fEXdelkGmC7cFQPZnFJwNssu8XP5Z
         NRrpQi7CmicndMWGFXJ7FOHSjd35pBtHtcAhkEeikxi+Pv3bmxc838BhNtbp9VASs2uT
         RJ8U+UXEDFodF4syTgI8rMOPWNuee5TlOTvhoqxOER99f8GIbm85DOvUEsG3Qhu57gRs
         G85pOVIJbDdvqDbkUk6f06/Gkg7KqIDuZg4hQv7fCOUusz53sqbA++687QmVcduXNDWT
         xkDz9hS/VJmoVJKChTyLHQEpAoY0wyksDiL7C6VTtIsBeBnJS9PZUz5NdSrH98IFhSGV
         z08g==
X-Forwarded-Encrypted: i=1; AL+hErEaRJo+38T91bteIZGkvNsv4g7Nj8P87puKnh2LOm47BiKP8qmDsrQwyD+KDTGFHtO3UPTlzPco4znt@vger.kernel.org
X-Gm-Message-State: APuU4Z9144UNhfvcPrNREqJzI93skdzO2IMo1sQDqjvqFzBFOrzotxHY
	zFOyjIHctbyxKHd7R0YECXH1w6IC1GbnFmK87CGZdWcFm+iqzh4EoDVWprzatVmDxCXIN7lIH8w
	qPrll/XMAPfRhQOKvQDvD8hXRqPEdyxbNMXbrJWCDC3D48gRCtC2tgixGte6cXPGO
X-Gm-Gg: AZFdTZcpm2QpY2pkj5RYknIM6dwefCTz1bTgLr/H+NalTaw3RyuyFcOLmSKCYfh06B9
	nl6BwYaeOUZ0lE/psujgJKrJxMk/jXzdrlxxIZNT4gOp3zmVuiC7cB174As9m7lXB+tEdsmbwBg
	0BhnKFytsR44DOG3gWMdU9fb15Uodd7kfN2fz1+J9nM5qMySMuCSPPPZaIZcotv6xBYIrJ3c/a9
	SdK8aCeBZtrYpjyxUhczU/J4mV5xMdukVNheiR7xdjKxeARK5p1NSjiO00DXidpTdr4YIfwyBZd
	MhBg2l9aWLhodcmUeszFVyLpyxE7eiTWYU7nzw7NiW0KH60jchz/rwN2kMOk874oO++YMJzOtcB
	Zz4ZNtpkqxxpCGnKkpumWqfq2g6URTWUlHJVm2j6mc3V4xiLjfXbtwxMNxDjp6jEAkfvwaqk=
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522951cf.5.1795601332181;
        Wed, 25 Nov 2026 02:08:52 -0800 (PST)
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522561cf.5.1795601331660;
        Wed, 25 Nov 2026 02:08:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm604969866b.43.2026.11.25.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:08:50 -0800 (PST)
Message-ID: <929364c0-9c21-48d2-88a2-caf02e2fb15b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:08:48 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXzuPZu7U+D6hE
 lDDLOEjEl3lj8a8IMEUZcsyDSWs6HdN1BEDTk1PQtobcmEta5Qf8poSTWCR0GGRfk3hnp+/zeVt
 /9f8h8Yfo9bdwZhB3TRf5jRWDl3Jwjc=
X-Proofpoint-GUID: V84ebS5-gnAcSVE2t3TNJ0zutgHCLl6U
X-Proofpoint-ORIG-GUID: V84ebS5-gnAcSVE2t3TNJ0zutgHCLl6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2dpugJzoF86C
 oMm7Y/DQGzbLQg8klInNZEVhpxrMmoOASfiQ5FrLCyJJ3/bg4erEDW80bIW6cJB3Ic52E+Azrxp
 0V/Nxra5YcClR+03r2SxllS1pVZwRjnSo3s2q8Bhs1W5eSQ7MxxI7Yqr+RsVcyDIm3OqRliLL/S
 5JDr5MMju9+/wGjLOca6gV5utjO88ECmQyGJhIwdf8nyJ6OL2wVdCRh2QMaYt81m0tyv1CdMsj4
 2088c0ER7K6QFFeYYyH16C/mlx1sMs36TiKFkk4+wWacgPnKdp9gY4A2wD2vORG52Wllj0yk1xl
 ASWCWYs7PcJ0Uxyv+u55PJGKGJTAQk+cePM12miFvOokwJDaQRBjNLyvDvT/h0cYUN1caGCLpD5
 PxIhw4VYs3trwL61Afz84ngqvzADqEeAqcHWfgx0QwXbqppqRZU3bm0LaFSfdTOAczvXEVblkMQ
 kSBqnrrRCuvCtBV0I/Q==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06b3b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QM-UIIi6bNSMVGtDbtgA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

On 11/18/26 10:46 AM, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
