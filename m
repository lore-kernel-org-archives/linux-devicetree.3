Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF0E48167F
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492837; cv=none; b=bRIEn0MzdwZ3KbzPorNK54MBBk6iTnDl6AoiGngvD0tZ1YMiGlyBx4cpOswM6tgaBKKAFFib5of7jVch5UYiCrVDeT3Ix85975HLqUuMeBebIKrZrMHiqnNQ5RAXkk+vZ/JrZTAenX0wbyR+QRqyqTepBauRbF/G7TcaS3VKZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492837; c=relaxed/simple;
	bh=dbvG9K249lCyefMM14BZFhgNNJ3r5ozhGD93sWzhaiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsFHqI0jusrhYVrYUny4dHZfbNvSjs6gz/nbZlbEB5HaD+ByGcT7z2nDegxQchD+PbXofXO4HuB1rpvfARvn6t75t15PKDaLt//Df+sCnQ6oZSPZtbWgsUKnOiz8YDpm6uosiS8oEA+NNp1dRhB9O12Jssfml7poMQatHFM7K5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifTziyLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVyCOEGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifTziyLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVyCOEGJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAeb02836581
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=ifTziyLKh9qzhc1M
	h8KULEL9XrG6sJ2Rxlru+TfiJczyUGqhJ13qjf7svvEAifWQjljbmR47S2Hs37ba
	n/gsT3aNTx7fenoFUw7v8edZuhLjxq/u4FzY6RXGs3geaSXMOxDBbFAzIpgimX+J
	JLOlG0YiSh//NFveu/QvVtQOoYJ0E9JLDWgio2kMxVb6nTyQAlsaEbmHIiyXwzpj
	NA83F6w9ZAw53xoTmE67j5FTiUasg9hygKStaKkM+nbAbYJiE8NX+O74ah0Hm3sQ
	aRFUnezZsufP6L4iwstUQISsY+4g1tutYXa8eJeDeCS7WJKNjFjOFZBOQrjxbuJO
	bodP/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb85y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:20:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a1ec363beso150307137.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492828; x=1790097628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=SVyCOEGJIBDg2XTkofHZXr/BLJBbWVphhtZcmznloxlpAIaslQQotGI56V9N3YYIVq
         hncVdwhMOEqHKB6KOMAYw09KuAU7kD0RMEiI3G6GGrSrMgnJSnqWU/W6WxjjV65Bsz31
         iga5A7dTyIz5jTiYZGkY9l2nY9nAd8RLTJq0A0StUzeu1BjiHWi7wcOM6v8nASD5RhGY
         Zp50FkTh5fR1xOZtuYk7qmmP4OlTzC8AMwMgUhPv6zqoi7YULd65LX27O6ltvCUzSRvB
         TXm9QvlgwZVeciJ6Cahdt+Ysly2tGjlcqmRWUs+jUwoR9svwaY7dcNMowbIfiZoUFV9R
         oSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492828; x=1790097628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=Cre95fSzrqXG9PckWgVDaUzlrQnASZFATkOrDmSDTm6cFz718ULXUbxpGG5btWHY+l
         d+K2nxmhShMQfD0bRN/z3CwgVg0VChk84xcA4eCOMbM66TgNlsjpw1FzsLn/WlJ+y2Xk
         W/d9MJjFGtIXBykRM6oXRx/OC9yDxJHwqOmuIejZFfkwxEVWQPQPM6IqVD9LIraZIw3J
         I6lgZET+T5CNbDYaLwSu4D6r6I6VNEcWAmPEgln6ujN3pBRfVj005qAyeYXj0Y1Ch29i
         b0Vga7xeQR6sU0UVlKJYLzkN4872FpMLC4CNn7xEcHClrr80bBfG1CbOR/NHkEJnODuT
         NznQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTecVXZ9yV9KW5+I0Grrxpuj5piiDhVFfZMkkDjdjXhqF5I77nc7xmsMfx6izj23aErrek5AUWQeNq@vger.kernel.org
X-Gm-Message-State: AFuF++kCb1hRK+qHBVaPFn24qEYVWJfIXFFNQXOBREty2WPqAjHiPX/N
	WY8Yr/iRjuLOoBjFOp9qkDZnbysRT6BiE2HWAS20n7Apcty1pdEGrL7lMexzGWgExPtQrf1RbUd
	Mo3oTkuRFFJi4fw9VV57GwP+CCQOdqDZDdTxWhUpzcxqdwV4z1LepR7fUX4R79ses
X-Gm-Gg: AYBFou1thVtbNvphYxUtzp2D4AseJUH5KjK+EMWO2R4YEPdDUQic7a7q9nFq1hXf4NK
	5F4QqANmfZUYgkA6OG//D2VhAirQsIV0nRDza4VQb5pa079bgR2eJyQQkAeCrdM3WwOgaUjhmQg
	zFiKalBhtvOCdupPKVKoPnGHmB+aWPRS753tgYlJ+hK5kd1pTtku/Bn57CFDJu8Wc9u7zaPRwTI
	kUq7L4yGKrFSG/PGNU7jS3WDqYr50LeEXkSF/5QAKP5KmUtUC64VkEpgxKc3cfVluFQvPtsKFC/
	fl3qd1ikhU8HoCEBmvMEW9ILVivlhWUu/YJHvaJ//ZjQ5Yi6GCoqp/brYL01mfCk4eCRuFsPQRk
	8BY13+RBsVyN2fqF7jgrpZQ==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506287e0c.3.1789492828460;
        Tue, 15 Sep 2026 10:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506244e0c.3.1789492827984;
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm26023a12.21.2026.09.15.10.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Message-ID: <e55093ff-0441-49f0-9d06-6c100c8107aa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:20:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
To: Sven Peter <sven@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Joshua Peisach <jpeisach@ubuntu.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX64XT8c4QM7ak
 0HSCSmESakxTEd4GoD5XiauDjZedu4ulraxAJhCNkCJbm9Goit6PQx4Kx/JrsH5a4PuaEDVdBk0
 V6PpsRH3k84YXaq6S/6i5fcyYi6kUJg=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa97e5d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=fxJcL_dCAAAA:8 a=i--5ToJz1EgYGg6QIxYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: OYeBIjda5uqeTpMy5CchW4aQUHkvgJyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX2gozRDbdtrWN
 CrnUJhwIsrkP5YMLO3WfcnhKIB+SENy0raz4Yk8FB4iPglcrizYM1cv1ftVeffOc+jUX8cfLb56
 HwoN8zfEICPYdKEAja9itXEmov9ODvyOGJQFw9kx8ce52WGYISM38kwUgaRmIzLPoROn22oeoZ7
 D2VZGPHh5v9BP4EIZuJJscS8nMYtzEMOT1YjAMJDeoySPI2pNQfzhPeTaUScB7+EPfyI3+ZCyxR
 RYBzVsIi57dPUR7e4AHDE5eCn2je5RqKusz/MirNwQEj4Vmyx1CgRtfMypeZSecBETHz+tCpg6s
 P07t473sI+5RJl1YzWfK0cJd/vp8IQ5v9y76eVKSUevx/8YheZBZuAUT2BNsykS9ctcjGwR7YL+
 Jrv9YBxqi3A8FUM9bnPtbpqsU6t0TnbTqUj2l655dQS8843iLy21uca1KJTe6Tz9X9kAEbIlWPa
 W0RKnn0xkTKxJuekSCA==
X-Proofpoint-GUID: OYeBIjda5uqeTpMy5CchW4aQUHkvgJyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150253



On 9/6/26 8:36 PM, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---

[...]

> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

I don't know how prevalent this property is in your ecosystem right now,
but generally I believe this would be more fitting as a vendor-neutral
property.

Konrad
