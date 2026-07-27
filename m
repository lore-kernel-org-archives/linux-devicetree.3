Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E82D97B7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161074; cv=none; b=LoKibU5QrBIHT+92W9ry2bJ4/PUUIJ+gSnQ5dA81Y/9AWsXoE3oozWSQdCHaCZdg1hjQ/LYwJLojO/YEPZEkDF7HAPHW9gfqMlLfnppzVdhUhtarl09hP2XhNNDd7U8T3ypQz5bNNZdFwubaEVxwds2MfLwB1CnECMFKQVlwTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161074; c=relaxed/simple;
	bh=pe5ZdIINMuKA3v+bwkuSgrAjyK9iXRBm1yCm5qbYovQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Oko1ANHfX4FYICswsNBm4D0uKuFkZN1lG8EKonhwP6ElYaTmQMWGCGWXq84szctDdHaWkPg06lM1DhLuOh6hmn7dnLxH0XNmV1J9uO3lcKAUtr56cDJbA2xSQ6QeciXyzhErWzSDqClNZvR21tgySv1qOjlelAwlrWjdZ6KLBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nznKsyxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9Mq7RvF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nznKsyxH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9Mq7RvF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDla9o3663514
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KtuLOFHTMC3S6hLH8z21W8AG1z44cR94ggj84/ysWsg=; b=nznKsyxHYMwCsNSq
	T4+2ZRllt4YRDs2iyFGVXkCb+/8kS7q2WN8F/GE6cx2uY/DS8OLi4RaURilliO7/
	cWarIWOF3jj5FSaJDujyxSER4SbYblYVN3UmE5XccuzzRsKdVFibyCvWKztf5DZj
	RkDAVURepeypU1KqvVkqGijly3+rOy/E4wmLnsDhJSZ1jPXR8HJhaw0hThplxgvt
	fVHKjh9fRMXZ9dYuN6dmHXCeUtnjq1Gwn5g8WxZNPfZkLHfqdIEvGa83I3F8Q930
	M1xPlSf8T5TaXJHb8MQnID2QpiCsE7JPlS7AXz3jqMiKWQxkp3frufnmUz5SzZIj
	/6ABEQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashrnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:28 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-976c865a8d8so87147241.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161068; x=1785765868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtuLOFHTMC3S6hLH8z21W8AG1z44cR94ggj84/ysWsg=;
        b=H9Mq7RvF72AwPTjAJvEOyjw2FFActnvQVQcSpuKqkuqBsyTpRntCGWboUCujeVfZzN
         X84oA65yGqHRlVsu0WulCxSYPv+G6fgQcPhdPfHGGilQqA+7k+d2bDk1QYdx2vzFD0+m
         md6zCs9pNNy6ySFoGf014kPuLXa3zzn/DfWmVsGAEyUzDdPaWN8KB9bv6S+xc3XW5kC7
         Lzd/C5+XKz0h7NEIHYSlrdvG4da3Y1IGX4aER6JuToOVFkGqdMPD6DTbgdW4BGqxhlAj
         /XAYJynpP2ICDz7t+5kSemvXwmVlwggYEFuXFNniTqex7QseZR8FuVk/Ud+JzBk6Ibe7
         Ne1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161068; x=1785765868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtuLOFHTMC3S6hLH8z21W8AG1z44cR94ggj84/ysWsg=;
        b=Fpvaal8JKgJt8SpBVJsk8/ZKkamGQKioKLLIz76kNoDCXNIgLTysLM48l7O6dBTLMi
         05/MJIT6Yo4N/tRQs/3o4U179/Q+ANp+lx5bjW6uGzPSN56V6ZFZsSh/mRD6qq1IW3bE
         CrT5jVw7i33mrQKLCSKGVS1BqksfgFaLSjiEmQSk4OjxNx/K1VL5iy2idRk520fh/G8/
         mJy1JmWAhXJCFF7fyY2UcS3g4AIXlEPDLunkgD5SVbXk6WxPVfFdel4CyZoQka1LMFA4
         foQJ0DLlhykPvdRIj4MllEpLfL0F2Qy9XEj+3V+EO8srcOtncwevv8UwvH4Mv1geceTq
         ji2g==
X-Forwarded-Encrypted: i=1; AHgh+RrLnIScQk+EybGh7sQXXHx1kMwNid/gCSf+NAQYN0U97ALEvPNgagZIrzuska2OL99b3KWkMhC6gy/d@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVmSLYc/vVKautSTkediiPSbdnK6CCgcRrGQTwtJjWn4iUh5V
	kb8jQREVXUxnCQrQer3WI37xrkxPNKUz1Z3UhOlkIguF8DOczgJAkbx3z6U2siL8o9Ey9esu7ve
	miKddDcywX759iaaC282kq9ZnyjKqCn91Wc+eArGuNIoNGYhjz0owTYJ/yxQzmhYd
X-Gm-Gg: AR+sD10TykoTBcko0aOrH+DDIT+qBcnSi4ZhzPBvvG34XmnLI8GQu3F+VxoRwzKdAe2
	dNyZNeYKcksxUJZ5cHWjxqm1TUvoZkhJ2U4c5xdgsim046Ko4gUszUF1GTXaKs3DadSh89SyU5/
	IOphhLJUlPzXuWkDzRKYVJFlEtvVZYlClplzpzL31ugyD+hRWgt3rmbQVSRK8iYqVBpbzmxu3Wr
	X5QC3CxDIJQwA1XMGQUxbesZsW8rFeoTuKr/vx1TC0/MBKTv8FS2ctct8TexiGVWINfML6sMi4U
	/gCkI5+mHkrsNR7yByFRVRddrsMBfSO8nyXhp37yiZQSkGIJdxuKbQ62AgU7FoK5kTSrBPQaGgR
	bYB2K44u4pI6byDeWI4vE/2TgC/LehnIhtGvJQhpaOE5ECw==
X-Received: by 2002:a05:6123:4e:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5c306cd4639mr3029404e0c.10.1785161067628;
        Mon, 27 Jul 2026 07:04:27 -0700 (PDT)
X-Received: by 2002:a05:6123:4e:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5c306cd4639mr3029354e0c.10.1785161067202;
        Mon, 27 Jul 2026 07:04:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm249027595e9.1.2026.07.27.07.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:04:26 -0700 (PDT)
Message-ID: <cc136d7b-61e5-469d-8956-758cf79e5f8f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:04:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] thermal/drivers: airoha: Add support for AN7583
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX8mWSm1Pvhcq+
 /k3s4obmzuEFsLENqQOE6mf9ZE/AFdKk+/2zPB0+XmRF2vegQD0Emj+fu6Y7P3Wq+nRGSte+rIO
 RQR7UAo9OXpS3tIKXmfS5DgdShmyGnWWIi6LH3VxN+ZgvnWqNhTqcqvsdGCfSA+ymERPVT4OHzo
 Qv46hw1ha4KE2D3dWWKSH8Y2OuokmAw2NdSBurwSZr89qdoZLxXN2w+9g2beIdWtJW7LjmgENZX
 ChmjhwnkCH3L6B1JvpZywSngc6v/JKWtmFnu5pcFjpOrVLTRtv3550pLXVKWSAXJxAY1CF/2g+m
 FVzicmuAv36djPF309ucy8KYcgusqWtYpdlmt40S516/AKdI8WJrTF9VXwEtaQsfEo/0123YAmx
 CtLJRiiS5gNSWznwivQi1BHpQLSAonsC+3+HiL//Vx/b5JmM9qUc9qfTBhA9F+K/rlhSulpXmQC
 /Lkmoa9jpcSI54408mA==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a67656c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bkhZLDyw_siaIAFfkZUA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfXyAJz8uKDdTCX
 NK4hnemi5TnZNs59FoY7ZxfXzstnS4h058Z1dra/mPYFQOdn8IEhy2be3jUwxYImD0QKBzhSfVC
 1/OZsC2gWMuOHUvPBDcmNmHnh3VRBWI=
X-Proofpoint-ORIG-GUID: -43m1WF5YZ046GRf4l7zcuHJgOOU0sGs
X-Proofpoint-GUID: -43m1WF5YZ046GRf4l7zcuHJgOOU0sGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270134


Hi,

On 7/2/26 11:48, Christian Marangi wrote:
> This small series implement all the required changes to
> support Airoha AN7583 Thermal Sensor.
> 
> The SoC dropped the Monitor subsystem and only provide
> temperature reading. Some generalization was required
> to at least save the common code with also the help of
> reg field API.
> 
> Changes v6:
> - Add review tag to DT patch
> - Add review tag to fix patch
> - Rebase on top of linux-next
> Changes v5:
> - Fix alpabetical order in Documentation patch
> - Address suggested change by AI Bot
> Changes v4:
> - Rebase on top of linux-next
> Changes v3:
> - Property use chip-scu for thermal sensor
> Changes v2:
> - Update DT schema patch to implement dedicated schema
> 

Applied, thanks
