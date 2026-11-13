Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580951;
	b=QxbNTUWmx7S/gpO83V1yxd4rXTgFh6z5VvWUNzSwn4lFqwMLB59H3V79oXW7uLmzOepe
	 OGPgdYOW88T9BI6OOtiDmfVF1W96o1Ogz6N3FX4BznbVKamz/lu7SEAOmm2HWvot6ufe/
	 XladeQz7T/VdpX9AgSaf6M05w4PfP7pWAxvAxvGPNvXeJTHR9N3Gr/r4uZDEbVKlCuYQz
	 rNfOHN4FKd+ICM3kTcAMoMdwCs5gK80SlUvmHtz7WZnRtlDpMkaoW/1zGOLucq8+kq5rf
	 40xmir/7oGa0Yf0npkn9YRL+UMriO2R/RElLDuZYYcC0y9UGxFP+refPiyBO0p0K5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
	b=a7s8YXTAuafKVeUVxRMBhGbFY9rfc9PHmzduTvFbUfy8CTYeYiazAR/xsVfQgONS5krN
	 XwpveFJnLCOOYRehIhiuL7i/17vDXJ1yMRndkNWYOnImwFMUeB8ZnvZn+YgSzgQgm2Y20
	 eRGsuwZOoSoGcSgV7DUXWMdk6vr/ZSKdyKCBCW9ADJ6VFk/+KsrXK7b/fUPWq4indZvXD
	 /wzUugUa1edjqUFbXHggXjcuJDIunT95nX28ai2bpddiLiZgx6B8tEXIXocsoWyzAH/uY
	 XMmgOHpIYMo7R79bmH2Ge/FZa+aSU7LAJr1ZvgO2pyuueZUU5vaHE6uvdR5j5CjQn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA0606A333
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CA0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbcr688697
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=; b=YymxBtwrPMpNZjwI
	dS/UiYllpzvW8Cj6FxCX1TXiuCYhyWexMvP5OFJ6dBM5e3DXSt3ukUe9o7hTJKbz
	69MtL4YAFXRjDVsQ8T6BmX1kds3H6sbMXro9nBHs7xgsRHOfXHAAEYjj0flb9wj4
	Fle4lz9UUvGFyw7Cq6x6POMZWi7OwpwQ5KdRTtrYxL3FA01uOHkRj47RJjGwdnCf
	w2DzE+L3Nzay0+W7MeQa+NsMFSSQMWo2jhgsVJDcZ8W0gRgGoHufUZv4w58qjgFg
	2b7iNk6PuY3TAtpRLwCB2OK0CXNx69Ncd9TLTtC8J1KXwHOOFOuUzLYqik1dXzRx
	nwZc2w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjsxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so53888137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580949; x=1795185749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=PZICF0udmnPEgYFh172gALIGRHcvZik/27g82Eyn1jXaZHG5b3c83s+NeUZ9gh8M45
         vX8xgvjKz+JAQgSJX7KpiKKegg4d/dyyIisJ23/SrQlP1hb5f8Oh+LH/V9nJOB6sV/TW
         ochErq9A6xvB8H8p3wZB175z4zbmtYhHQW0yCZMlown8ZUZLYyaqPUm02dBnsAhX1/im
         4PIzcj/sBliwjGc8HBwLmi8AVn8E1FW/og/Kk9eSOwmIm0a3KUMxRt6RmwbuSJta2DHz
         BeAUB3zhA0f2Dv4WIsNK4GqyuM1brCwh1HqRaF3SZ2ivbRLUGxg684ycIi6RvQobUTxG
         XZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580949; x=1795185749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=YyYnjWbxM1WLsSfmRxYEtj8FtoKTBJRKrpJyRDenB9uIoRC9pcdx7/4iWYORj/y9kv
         8hraIVX0W9WqdS3d2wE+CXZTKHXTFMPtIE7/VbsS0BuU3/TmoZsvif8dJAJIuUovrfU9
         /qb6eaSqkGwsC19o4tk4poN/D0p+cinDBvJOOCgAvuolDVNrJeYiBJP6N7L7UkqWGfcG
         as2/zhNY7fWcFaTrJckOKJJtzv6eN2Co61ODb0zOkP87471btd/E/3x/R3DHdSW3empR
         NUrDaQQrcpv796dLYlaNUb15l4IMkyUWmHid25Q23eaIs+2zmFUyRca+0at41xqcw1LR
         R8oA==
X-Forwarded-Encrypted: i=1; AL+hErEjJIlLfgOsgqhnA4Xz4Gjhr/GRqwymLU55u4hzEVi0rX/Nc7uZHxh+oo4pFutocD3wjipPzx0nCD0H@vger.kernel.org
X-Gm-Message-State: APuU4Z+R4Vw8HdQZxlkFXiHGxJHh5i0iG1s1H0OLCPpuFkwVBUe16/DT
	dMuZs53lev4451AmNHTF/nOosaTY5Ae5DrpXedRlFl2/mV9tXjeBlsfE6oDSSutg/Gulz3aDi1v
	rDqtGcyniVbYIpOmAgzvEIOMdRV/+a2nEhSJCbOQzVQLrPb+Ct8s9X6SCV9Lm8Aau
X-Gm-Gg: AYBFou2bwoumIveb/loDo2GDfsdAf8nkdy+3OfJGfXoswS6m0JJbfd2swu8Jmnt1JIg
	Je7XzzlE5OcHzSh7nCW4cZ9XiUWutNQ+gBSenrkVgA1/OEH3gRk9LA9FkSlytmGYNTbKASLwGIN
	7CcBw0s5JxfYkNvLjRTZu6nasicFpvGlLY+qdJzroKtdYZCeZMoxqRjftjE2e0fzTq4vQPPAbKo
	j8HnEzr/nRLRfp9smRVNbffsVeMdqsfzy7+mzbGmKX8TDDARztPfJse534c95/gXGj/zMz4A7pJ
	1o06H/cN0SD46gGms/BqcMa05QSA+Ojb40fYpVA3ChkMPqZITKHOchkjPE3ycUXABw3MbbLzVI1
	Smy/Mf+o9bX/nXBapyzI3fIjJT8L+FX5mZGoTPT7x1SP23GCbEkAUhKxy1hlcwk3TtnM/UUI=
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832946e0c.5.1794580949117;
        Fri, 13 Nov 2026 06:42:29 -0800 (PST)
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832924e0c.5.1794580948486;
        Fri, 13 Nov 2026 06:42:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42163sm111420066b.41.2026.11.13.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:42:27 -0800 (PST)
Message-ID: <21a22750-2586-429b-9179-da3548c6c3f9@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:42:25 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
 <avcgXkYgdjpfnfbZ@mediaserver>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <avcgXkYgdjpfnfbZ@mediaserver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _w19PhfNk-Z-B2W9UuPM3iL1ubUk5uir
X-Proofpoint-ORIG-GUID: _w19PhfNk-Z-B2W9UuPM3iL1ubUk5uir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX5HtFfx/x9dYY
 O/g3Gdw8JqG3MBN6AOynE0w/ClLC/rOvG/i7x1jFXPfOkHG7FcgHYdbPWFRPWxuOrsezVYRMrvN
 e5zkf/vtOjNRA1iToqFlCuxzDtBVACi5mmyz9LmsDedksmQgnO7wm7kNpfM/Aq3pBcAMRyguEKN
 bl64dsOCYrI482wvPU8/fgXJgxJRDKCBlLbeh+faIPbTvJr9Vmh+Qy3YtxlJx0ATOBcp3rHtFNt
 ZwOV4tOFlGNQFqN9Zv6VyX47mjCb7jFiLCGxpljInbbMxpPb/FI69mozEQbeGAEMKwyWl2higVv
 hHMfU8zJPt8ABUWHadY7GZYD+HQRUOrWgz0SQP6oWL11umlcQZvE3YkPaKzTxajpqGKLFPAfZkV
 9TunYVoFYwZq/b3yShwWtfB9raHGtzYnkB3V4zPRO2PFj0K8GRFjJ8ArK13Plg83+sEwOydHWw5
 wYIQUMlEEPiUrbcMG5Q==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af721d6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UeJPBouCTXaZwcwbQKoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX2PCep92eYnKT
 mrNvSaQzYrlw7Zg2oW6UV2TQGaPlm3TpOQqOMP/Xmwus1MXO0iD6OF7wL2itwwS8Lhry06HD993
 dXq4LHyrdHHvOYsgwvYnTLN+kLKmI5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/13/26 3:36 PM, Aditya Choudhury wrote:
> On Fri, Nov 13, 2026 at 09:12:24AM +0100, Konrad Dybcio wrote:
>> On 11/12/26 11:30 AM, Aditya Choudhury wrote:
>>> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
>>> dt-bindings header and the socinfo table.
>>
>> Please use the real codename of Camano for the following
>> submissions
> 
> Thanks for letting me know. I'll adapt my patches to use 
> camano instead.
> 
> Should I also send a v2 of this series with the codename
> corrected from crow to Camano?

The current commit message on this patch is accurate - downstream
calls it crow

Konrad
