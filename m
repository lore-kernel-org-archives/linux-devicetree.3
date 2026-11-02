Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622245;
	b=IUu0E1JD4MLxKPkwbxfS6eWMx35CQ75A4W7vGKAV5klyCBkLg3f1f2VpD2MBm4dZDipo
	 xHZsBSk1XMKLii5o7WOjRHfzmbACDlOxoJHiXFg9Vr0+0hSS5Y1iWqonXOZbthm9e4IXX
	 XMNePiymUAETo4pMBHJy7FC3LSUWymcX8CWe/1tFBnK8GcQm/y5EsYH9szPNKuNhlokuK
	 Xi/GsBdhuX6Y+QBTJaehNOZ+nE4ycl7t7Ekyykxg8g8ukaRTbDjpZgISjgDKRigT79ypp
	 tVpZBdAktWWoD3/XC6riEyMEMgjnPR99iUmXBPxgtUHXrLqdqylWUAuJiIDH+WMSzFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
	b=vBce+sUpiiexFwDCzhzUvfAL/Ws45p6+Bx11/HQlqLmCuwXQ8aD1Ico31Ib6uIKDfHS3
	 2JdnsyaMl/Q4+jM8Nxc+6Jbqej6xireJ2kkP1k2oS82kDGy2TAHlczsraApRa0ddPPT1j
	 P3E+OH47Noq6LNmKg5k4ZNGAfjBE46AL3ltHRF8MXClUr7xlv2HqQwfKG1Y2nBPN/UEWi
	 bYBjsRQHJpONXbriVhmMfRUXDMr2Yk+Dp7/l3wCkPfRvgG+VOciEsSoGFenqGg7ox9KfQ
	 pkNN4dJtEb2n9/gPGmjYmBBKNX9aCdtIkha9hvn/dFWExb83MI0GlAdDGnKwtm5YVvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp8DHLtU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aVXph5uG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD1606D265
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAD1606D265
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp8DHLtU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aVXph5uG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOPP3086531
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=; b=Wp8DHLtUIYsr6dUr
	66N+TY9Htt6YRfP44vU9IbR+v3LGKMNdhONzUIAL6d5AP7CiSxaygGy1g5hJA0RE
	fkWYgh0iD6HiwK0KHIC1gvS4BIezf+c0MIJ9V7Ja5K+MtAWgQB0TNe/fTs5tbGdn
	g3MOyRAV4mciB/EzPhZsJCIGya1UHxP6oGjMo//wStsuMN63T0lTIf9pUpeYifzT
	hIVjEcb43+BPI/SpW508B8gKc/IX6GuSbeHHg72t+x/N3jubwViMQ7P9H6OyZh6w
	hM40nsAkIWOqY2MOkv0oAVrf9o4ULFPuNN947CkGU3cPVHWOkRYgzvjZ+K20beU1
	SkRHtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61s1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so587606685a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622243; x=1794227043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
        b=aVXph5uGWRSx1r0qpcFkCU33aqgWSyUkzS9PNARx9eKLfobmKv60oz2eUyk2PyzmsG
         Vjeifb0nWbkSpV2F6k4s5TZShiw8eLBfk+5hDbHnM00VC3m8dlvWsz0TCR9D1WYY8iDw
         thOb4ZAZio6+3gvFEwcJNqP2rn6LY4BKylUXyyCc0lzXM7iZgbivgKPJI4pTgI//mo99
         TCGtE9GsOPN57XrNhCeIv8ptkmeOGPNxPvxQqrpu+4vgFI72i8HhFv9EQjGYZ88JIQHB
         8WHzZymuK0hnTLwBnQL2IB/uNXTfVuzXcxO+Hcs7a2s0g7wWv9+9M5W3Ji0Pbe++XSKU
         7ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622243; x=1794227043;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yvj0qxBUINh7wY4gdkTLWBNvQlQhWtLxMm1qk44RU8=;
        b=PVtQpJG3t0zUdytGkvPY4Ggqb3w9FPmkLQJ827IE0l/RVcvgRCCGOHsNj+CC0avOFh
         +hmqZZ8UMfykzBMtYcBTWDBr30NfOioSzm7r9xvbVKnGcaNUyel+Ggs10YYMhXO27EEe
         CGRZ2gGX1tJD5pI0OhtmtKwePACG6ckCNRZbekWqR8DTokCGoum4N03wVZ5QWZUuytXj
         fY1Jq79LG+jLWKlSYPt4x1oS9Ze2EevWZTjEXUEaTL5XNxr3A/FI/LRRY7P1eC9iqlwc
         pQZdMgSwmuHbV6QPqnq7xWPUjvHqzDNoADfeXXha/RBeTUcb/QsScIhv5qVlJ09ssrst
         y64w==
X-Forwarded-Encrypted: i=1; AKwUvBw33I9uTfXvH/B2sJa1Wdnnx9TXGEVDlcSn1ZMmZtRbpY4RuFn6Gy9LL52b2wkPSlE9FASjlzXIdV3g@vger.kernel.org
X-Gm-Message-State: AFq9FYK7+iT5jkkg/5elyfqeJ1ADfmW1Gu5MDqJ1mPJgLU228+xitFmM
	9v3lutGJEd9tZupr8+NYp9Vm/+5B44p0LUBnAfAx68WAhLx2krg3ZtiuFihO1kx2FL5PQHR2NI/
	FRtG0p70YtgT+I/AICjbCnOpDEqBxIJNZf2C2WlSfZm/Bw337P9G30g8Mmw8RK+5O
X-Gm-Gg: AYBFou1mAvfzxP1rCTD8eirs2tOp06ENpzXdeywcFsSddCN1JC2DL6xzKO6u8kwCvWl
	Pyc5PWuIawbXhC1NMWniKlv1WRSrCMVqdiNeZQ+7TcENLEgX2i3a/LCl9dCBS8ukdOF7dBGDol+
	hcxyqc6IfVUbGH0FcrdZz3XOUH0ot4FpedQoUu6ZGEf3FiJAUYc3nbOthExIhiR7/HwHoIq5l7/
	IgRgeN+iV38bplnxenYAkMGluJ+7a+ofJbW88cEAtf19ZFDQaxfnW0dPNC5YfcJAXHXKB/+V7YY
	VXB0t9tpX7II/kv7O09hMMhdNabKbmz97duUB2nf/FIQ6RLNC3oGryKOspRTu2duKV0I9Vycmvq
	Ma2kZUwbncn8loy2nNA21p1GBX85tJiKUR2Wzq4FwSrAtoXSbMITL8wqJZqRFL7Z6tavee2QM7Q
	==
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1545805485a.1.1793622242632;
        Mon, 02 Nov 2026 04:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1545784385a.1.1793622239039;
        Mon, 02 Nov 2026 04:23:59 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm383627366b.7.2026.11.02.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:23:58 -0800 (PST)
Message-ID: <21b771dc-e9cd-46b9-a456-0950ae1270a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:23:56 +0100
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
Subject: Re: [PATCH v2 0/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Vidhu Sarwal <vidhu.linux@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20261031-tf-luna-v2-0-ce403579bb8a@gmail.com>
 <20261102-massive-busy-woodlouse-8d0bbb@quoll>
 <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pu3NrQziOdjGksWOtXWK7gQOq8ATS2vE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX8aJ9tIO5RVK/
 iJxm/m1W1rZoPhZqMpwfhnQ4jpc0XSgXkJ1jlowro8XIxLvCjpmAsoDlDSV8Fz9WSy638aWGAt4
 Via6xx00ny/dB1ya5Pp5Ke6mllFvI+8=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae880e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JtIBhPYq3qQR5xcgr2gA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX2/HdWGfI/3lS
 n3jNBKTK4kI2u7HWFn9Rx4FmahHmTxAK61qRI6E9vWZFjl/ZLvlaOJj8Jj5qTcdcC2aFs1xTM6D
 HdEfuvzayfJgHsoA80+eW+IsZb/WwNMtV75u3p6bi48bv2wNuG7oK7SpEpghRwcKVLiiyiDKSvU
 MKZAxy2BIsyzRSaq547KWFqgpTqN/dtfmuJTAKkv3pZwg+mz9Oa+Yu7oly1Sxzf5ECaFWN9tjy3
 8MLGqZhiHgKkE+78z2hY3h6pHCjk7NbfY3jYj6TRXBBMA3REgbPRhGnrTobIOSVVPjSFXym8jQD
 8kv5IHKaB5xvetfbbC9VCMee89ggUJLQ+KDC+dTSZzuYXF0K8lfIXOHSF0wB4Xds39ILQkPiKQj
 FYbS9if4xAEXK6oind0SHfg1IoBIrjBSy3BZc0gHhoHGDNJ8O4MgtJMkPpgJJO/GRvr6H1wxiyq
 8XMJk+U8suasCWDxmFA==
X-Proofpoint-GUID: Pu3NrQziOdjGksWOtXWK7gQOq8ATS2vE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020049

On 02/11/2026 12:48, Vidhu Sarwal wrote:
> On Mon, Nov 02, 2026 at 11:47:56AM +0100, Krzysztof Kozlowski wrote:
>> What changed exactly? b4 diff fails, the patchset cannot be applied on
>> any known upstream revision I tried.
> 
> I am really sorry for that, I didn't realise it was based on Jonathan's
> iio.git (testing branch) instead of linux-next. Patch 3 conflicts in the

That is fine in general, I'll wait for next linux-next.

Best regards,
Krzysztof
