Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088237;
	b=HSgDNFixPZqPiGnFP1Av1KS4SYTJQPOcrLNDVjn0we5j/NaA669D1020Q1Fw7pS+tL3n
	 IzcWYf/+fR+De2bY3t3Pnb1DJCCS0TCMawRyiCmCidqCNxGWy6tWf0HqV1SE6jjBjrG9F
	 ikJaDIUUziLQy7+uYdeeKDNQRD97u6JTsbUztcXkrPhzpIWS0R7gSFSzUU3utN5+yE4Di
	 hDHy++GRPF+W4U7z8gt5CfyuCcRYN74A9vkZTM3BDLiubI1aLQ9OlRAmusxvQICsut16u
	 d2HVWcLsRRgWSp8503EJeClGz0QL7ao2Dj3DnL4DsZq71/VwHexGTsiWBEuGxPbKorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
	b=k4ai2meLiK9iqHST2Im0m4a4VfHRzAXPewYoQa7NJDbWqqlj1WIV3fg1jfbT14XPYMjB
	 jeMXXCw0PrcCLVCrRyyTQ4wQtPeIt/Efpp3NxB/2y66ia0LaDLufs6p8Mmf2ASKuNbeu+
	 kt0zUQvpYJyxp/QfxoNk+WQBnRUO20lYwz//3hPiVB+ofOvYLzM/2z5UXcBhQ42jwrbCZ
	 9TFYJWDAgES4r6jT9OBJli6e/vlC+7B2R4v03j2X2rwubSSYztb95GLEMCW3XjdTiXRCs
	 c7xFHI3E46C5Dq04J+9tfNKS+dtJmdxJmCvw3eRa+bDYXEehpo1+g7J/XEBACbdJEQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6E0606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuOpc598384
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=; b=Grtmjwtd2WrqGcHr
	Cg84k1x+8W6B2qV1BAxheZJdkVwmTYlw2TjCmToqVc5elmng8tDROjGiz+Gc9Q1X
	Yy2+imaF1q323teMmCXEqkVV9LPsgJhHToJIgPDRH7sMFyHcuBtkX58CZw85zhub
	b9dQ9nL/StXJ5kEIcZwfgzBPtkup1GvFW+IgC0d32pQwsOPvjD+EVQuODVMUMumQ
	qLdCzwD2VQRAXciHy1JC4e70lUCPoIsHArpgWykjdBBlrn7T+ZQAVrhCq8iKXMEr
	asHfAQGanxarmAAg6W9XzLKnNbpxh4MMCS200wZ0iYNjTVNqHaoD13SX22caAwYa
	TiSvsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708m56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd48746a49so1383113a12.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088235; x=1795693035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=gi6fAnnf+G51wYczPOqqwI+BycEfpKwczHXT/sBFBaavybMPy6hS+V5x3AXYYegkRA
         KtZEXj0DDiRN+F+8gL6e9HrIywqWuOUJwgOXGIeXTf13ssyQKo0i/2NC1xk4QsFNkZbB
         Y4ws8vkWb+b2aBicFGhUZfiQBLOKRR7cS3No63wwR/uFprcXcqzjScNPeygxObgPH4tx
         CC+xN2abq1baeIEg+BNQfMnKaOFHD4KlJo10cTUAhh7zGDNkZALbBMCNceYHzXSJLvpo
         IvtW+hCofUJwkza88DIE936VwYBCXo2M4juJQy+6BGU9ea0qKi/hxrJOFKKlUEmkQkG+
         kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088235; x=1795693035;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=mD0qy9j6lpLiZADcVoAyy3b/vAcF5/NQYW5cKuk5Uvs7ICa4ORZhlcHsF/OC+4ZOab
         K3XeUXvU1N7IGF+J6j2GW2LoKNwiLnjto4ucqF9dyahe7NorXX99gPfHpQnG3KkpHcEJ
         Ubos8kd5/EuMukFtb30KHEi/e5NX4i0/ZGP97t+6zvjVRtFl03BD2VSD4rVOI6qu412u
         gOaXTt2xwBerEpoY8lc9T7LPR+MZ6lUsWClW7cXfjy/JzTnsAssCdHh1FzG43PTv3FJT
         PAHqPjbI2IZqjeEDCXocV6X9ArrG76uLzdtoIWqZB7FxAccafovGdP/WEV44uPvFRQ2C
         fNLg==
X-Forwarded-Encrypted: i=1; AL+hErFP8NALrT592QxYfzAHpLWBqpiMt6i3HlnyESNc69/QqGSRjXNv9eSjz4V8tl29mgDnA5P6xS1p3A6V@vger.kernel.org
X-Gm-Message-State: APuU4Z/yNsOG4Wv0IqymGCMEDKD85aNFZiWKuTL5xhF6UdbAkxvFezxo
	nE7utIjwucM3aj35zh4e3P1arOLXYUcIIRe59Mibh7t4ZcMRF5jJoSK76dLh/x32PoZp0HwNr4N
	TVxM0huYOsByWdLlR9dNJiX7R554fdyC5CMNy5aQcRhAgH8rJhY10OIMjZqXRY5+h
X-Gm-Gg: AYBFou2Ti5ZXVjRXGdUpaqXU+imTAN0s9yBT9LM66zNB1b904OuNjfr2FbuZqxTxg+m
	wQ0jIfr3UjJZmItQFfK4ScK0Pyf6i81ssvTm6t4HTIulxe0khivP3zoa7hNo/x+X/2DSLY+qrr5
	JE+5DZpv0jxBrELLYDT3GXtMYIGhVeTWmrQJmzbnl5Ch2HwfRzf9zDxvOY+iq2nxgsMfptHRAbZ
	h59RJ+LiPhhECRoJlaLJplBjuQcxlr6JZZ3RZiVKJD6jrlGwvZy1ss1lCWXznNBSoDg6QQNZ/1f
	G/3Z7r6qluzI15jtqf4aHizQGmywiDG0ismFSpJ5jbTa4OhjLNfgYc3uWt3/tH+7r+ebs/0ZtFR
	1I97dHpIdeB7K0LKJJwc/e/qNV3y25gYNDWmvMBqIi9woCTfbi3NETbCXqtY1aUNTGohaYThsyt
	f/Ow==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801555637.47.1795088235146;
        Thu, 19 Nov 2026 03:37:15 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801537637.47.1795088234727;
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534631b8sm1663844a12.7.2026.11.19.03.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Message-ID: <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:07:08 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RVksZahH212TaoAmnIlnWW_0lt25DA95
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afedf6c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RAPgPVZv-YkfXzKxjk0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2bK5hAjZln6f
 mk3T37fMjcjFL2bSRaq9aH4Dx623X4IlD5Um5lVnOHtmzmOF6Rh8cvRAXCSJ6E4eNHCRPnozYB0
 vT9RKExL7t0WBpVv9vsZWdlN2t442/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXyKKjzeXuIkZ1
 ZeoO+fxeU+prScKHA9ZrkY59Hy31O/il6tCujcKTARracQthcD8KEvB3aU5VUXD+ahmhyX1bsTk
 bbxWvwf71YdfdUeW1kkLGjNNscK4z023uX6RUKL2CiUlQA/vV97LgCupFTiwBCMyvB5ju5d5p5A
 KKBaW1dv8NB3FUPpk0iQxkd1MCVt6hFZmVQ5caWokjfwZGhwfxoryylkCCZ6UQn/LZG95BuiCrh
 HIktdrJPhx8N3ayKgvuL5AtwQFmxBjqbi/y7EJWPlnsstzZPzjm3gnJzAX7/yjEUC+yGLjPs46L
 4m5BgEJCdhoqk221pFvAJhTv+SPxjptZKXRbidzyZrUMsSHKjFMs0zpIa7jv/qwDOjzqoeW3JPc
 7KnV/SjqH+ESKovN2Vi7giMOp83oPDvKuNvBtF3o1WI9tr7H01X+9RAEpUh9YJnjMGuDMR3bZxk
 RAMz4xJj6ffRDAZV21Q==
X-Proofpoint-GUID: RVksZahH212TaoAmnIlnWW_0lt25DA95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046



On 16-11-2026 18:02, Nihal Kumar Gupta wrote:
> On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>>> It was not used in-tree yet. 
>> That's different question. You added ABI and that ABI could have been
>> used. Was the ABI ever correct in the first place?
> The documented ABI was not correct: port@3 came from the old X1E80100
> resource-table mapping, not from the Glymur CAMSS port layout.

Hi Krzysztof ,

How would you prefer this ABI issue to be handled, or should I
send the next version incorporating Loic's comments?

-- 
Regards,
Nihal Kumar Gupta

