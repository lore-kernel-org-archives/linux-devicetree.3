Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196604;
	b=FmkNIHlR98u+ExaBk/YaROp13cRP3RqcnrIc2Rnx/lHMpU2pkEbrDfGkcGJ6pEd9YOLc
	 FfoFUSGSV0SuQIPgxtT2uZDgosRLIdj0q/2K5Y2BuLHEq6HwBMhZmqoKitnmdhsh+MNNZ
	 aKFI9gl/rP/hDBQNpiIzEvVzoblI5n8719+gPjzx6SDjm9XsLaHlga0PeTFsfc4xoa675
	 wA4hNzV0PuuHZzIKMyNKwlxMICjTgIZqkhMYP78PmWyTD8ODTlzAJLokytaGcVJTEumVK
	 uWSuOo3fybD5K+Myy0TUtQQV7sTKR2V9YHOl8PqhPSdiQL/jCR7alSfJeC09qT9a+kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
	b=Jy9hrHcMtoyQimH6Q0NNG3k2EghxHppTSg1Xb42d+9pMSWcEUrdMn0ERZlE5ieTskX4N
	 21xPaTzN4G1B1oswlj8/O8mA4Zf70skir/DmvZL9R+1E1AwYuHxRIians3MO5WJuHlaV/
	 GUgjKnNOz2jrUXmt6876O+MDv1o84LyaZJ6sEvYyiDiOuiJ0+0aVs/0dJL146CARdtPsz
	 HI2DLPVvs+ZpKPmfEFADpbJ78wb3W+pz0JRLe1oEOasQOanKX8zEXls+UVI3dwqKpv1Dt
	 Ixr/NESejz4B3ZKcczNHkazBtWgXV09z8JgO0NO3RO3QlzgQliVJb/c4hKqSI4wYJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3XuOEdK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJEdSrfx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92980606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92980606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3XuOEdK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJEdSrfx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBecSW1054720
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=; b=m3XuOEdKG6c+UAsF
	jwDnT2dsk/HeQBM7NpYlHhvBNSY+qEH8YZzXyzyUSLbsl/lBSmCHdmefdkQy60fv
	IwhC8IYfHMcFzLd8CTGLGbhi/u/aFSZKx1OzGiGmNdl+lU8TiBL/RyFW7tb/K4wC
	bnDp2E49K6JsGI39vmE2i0aQ4kAJEAG/a5GL6d1fUstBo5s3uqnPLk6Vc+rwCbUZ
	xnaNjHgZiTXTWGElubJMMPDQRz9lYiuDoztfVvF2XTESx39F1PsGMpSHBeSE3ZKZ
	vgYCEtFQeUquvflQ7Qz/7W+t6p+rfErIDCCkQ9H5ZFxB5ZMGFPmRhqMNklh5S4CQ
	mhkhpA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9s3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:10:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c798d76so22024137.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793196601; x=1793801401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
        b=VJEdSrfxPckdZVZ4FV/ePhntvXymgZzOwU098YSr+HdxnB/YM6l50ESqtPHIg/7zkB
         ggU6AsUZXyfk9ZGI+VEaCfube4jIpCZqzNJnD0iNGNZqbf16hyw+J0vH6nXrDp72EIfp
         mKqOxk0366vhODjSeYQlwHQPqZPKhyxDQTsA5JrFtQULjYjrNczF2A93CqcN3fJENGcI
         KDI+Os2/30/ShGB3Z+f+l++XZfLiprqdHhZwi4VXPdSgc/ZFxXXCfztkzKBKem8BQLh4
         bXV4II/T3FYy19AeXdGBD1S9E2yNNWYVw/FrJmtYQ4d/KrV6aH7RDHzNztKGiqe9esDI
         LXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196601; x=1793801401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
        b=wZmwVthuSGNYeO7nh0g74HXNqSUdtzHwh456V1aBmfjHIS3iE0eKkZUZ4ucOuvDBGq
         SKmTY/xz4OjlGBd9CZu2d9/UPK0f/WxryeyzTOczogIuFjVManV3DNwMEu4jppvPR826
         PG2wGPQOfgohmYxoZbZs/3CSqBpBj1+6Fs8np9lSUdUXwdU8fIdtsDuH2jJdeOLvBzYd
         OsCWQCVo8v8rvEozvoGs4qak7bB2uH++Wgaims4B1/J+/CMhgwIVlBXXQe2RFVmmn1cn
         uFJ9I7ApQD/N8ylpcNo0DsDR+ZHgJ9JIA7Iulisou/tRs7PrjHZYAwGTOABIh5LuAAwU
         MdBw==
X-Forwarded-Encrypted: i=1; AKwUvBzLuVBQXTLTMZ/OycZy7K0hmCZa+1XzRtwj4+PFOaWaQ8RHwLQV5nvX/CpVrD83qRAQJ62HDXM3FuYP@vger.kernel.org
X-Gm-Message-State: AFq9FYLJP80OyFyq9a3/3b2339uBZMRDyEigeP5GTWdpY3TpRwQgQF2F
	3vJni7JOiTCEE/S2S0O/kloPjxoK7NDCY48QRopvEYWBSRHx3Rzn5Scgr7OmgikxpcE6GdPxM9R
	24VFwfBm1+UsRy01NJRyF4kNURlPY9uppUsaWAbYGX2Xee7BsSepBvwCfAAmHDbTdDhMiP5fM
X-Gm-Gg: AYBFou0UOf+A+0Pqhza/ShqkrNSSlCM7Cf86jRX26u8E8mX2/kGCbPYecIM8Euet6JZ
	Hf9mSQRHr3pg+5WsTKiKT2IjvfqzW9kr0V350KZ9VtrEGSWvW34xEUPqumWp4/zk6P25LDh36XB
	/3QaB/vmcvBMRWujcWz56AUlPEtFNARSYh7sRbsMNHveYzL0HMK8ShYlDy6OqkHyLaMM+s9cvaY
	7O0PO68db8MifdyNRZz62m6VieEFI6r2z2puPIEFrq8w8L/gHhlDMaecbN1lVewbBACwnyRKu24
	fXNtbESCV6TZ3nvqk+awuivNWcbKmLF+xEsMrAejkIHkFmyw187BuKjnb9i+/ksKsP92iOeoCLd
	vsAuQR8gA6gSttg8cpoj0MOYeC2JGJpssLTVuV7PbbouhpEYmX6G5S6BYdLPKJzqW+p9rdZA=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr928075137.2.1793196601488;
        Wed, 28 Oct 2026 07:10:01 -0700 (PDT)
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr928020137.2.1793196600819;
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49642026esm1559192a12.22.2026.10.28.07.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:09:59 -0700 (PDT)
Message-ID: <894c4e6f-cc8d-4ac8-8401-d37c17003398@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:09:56 +0100
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
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
To: Roman Linev <admin@mswin.me>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        barnabas.czeman@mainlining.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
 <20260824155535.335494-1-admin@mswin.me>
 <20261026174436.305327-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026174436.305327-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gc61AZNoCA52sLOqbCszJJIJ4H_I0X1g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXwSs2o+/IGKo3
 P7WVd6AcuXXNz1HDtBKa6eAIuXd+S9AsQR/1IgMCNDI3RPsz/itQoEog3Tt5rUDw+bbXLjdvozb
 g+yXoj8GGfjlvcWkfDOAc7sQbYx6mIo=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2023a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MpzG7HhK7Oj8BWxnim8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Gc61AZNoCA52sLOqbCszJJIJ4H_I0X1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXzc9pI/OKX6Ms
 d82kolvy3H7Tp1HnjUqkCElzQVj8zIuhN4KkLQQUDNVHFlnkpb5zxjVmqTJepUwxOr99sEdyqJN
 w0RUEowjyihPWbEpAwTYH859p8l3mjI30E8pUBSvY0VhWmGGMkBhmwVHaf6VyArThlxQyUjOq38
 0vH4VMSGWRI7/YnhdXuA5inW9kCTwGooVsyXVYbu+IASuw0SZmkRmR/kr5B1MsceSsYQiTdO/Ql
 0T89yVZ/baPO/Vwj6qQlOxtlovqFGvUmOEUwIjpnoJW9YA8KTxbsAMyhdg/Kfj10bR3XaF9J/tW
 gnOmCgvL0d7EAkv5gfwJIRez0Gj1XkDbcRo4NWKpb3GfKXe0IoxdSTx6UDgul1y7lMIOSSiz9EY
 7Ift/mN2TuTTq8Zb83LQxIC8E88IMARZ5GyhlYx3ZMX1xQu3+n6MTolBqbt9hWGDNJfYbIzV8Wk
 D2jPOo7Yv9cMkc+vFaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

On 10/26/26 6:44 PM, Roman Linev wrote:
> reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
> ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
> firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
> ending exactly where camera_mem starts, so the 28 MiB in between belongs to
> firmware and not to the kernel. The dtsi nevertheless leaves that span as
> normal System RAM and hands it to the page allocator.
> 
> Every sm6125 board inherits this reservation and none of them overrides it
> or places another region in the gap, so size it for the firmware map in the
> common dtsi.
> 
> On laurel-sprout the mismatch is observable: page-cache pressure eventually
> reaches the span, and a store into it never completes, which hard-locks the
> machine. Before this change the board wedged at roughly one lockup per
> 59 MiB of buffered reads; after enlarging the region the same workload ran
> 691 GiB of buffered reads with no lockups. Booting with CONFIG_MEMTEST=y
> and memtest=1 sweeps 17 free ranges with no bad ranges reported and skips
> 0x46200000..0x4ab00000 entirely, confirming the carveout is out of the page
> allocator's pool.
> 
> The downstream laurel_sprout device tree describes the same base as
> removed_region@46200000 with a size of 0x4900000, so the reserved bytes are
> not a new claim about this hardware family.
> 
> Signed-off-by: Roman Linev <admin@mswin.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
