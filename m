Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795836206;
	b=48J6HxGA1NYZqvMzKzCHMi4Pm5lRg9wmslo3khIW9ONQ32ICR+esz68zUe9TXudjGSg+
	 ckoNyi8PVNw4n0tg2L54qDDiODG8KWD3A17ESL48LQeN/uac26CaJ1sW9H2bRAatWBtBv
	 bTAVeTjvfTQdV61/hV2Bg/l1XiX832mXJ3fjqMGE/NvDqfwTa9mpE+PeeErXoy2geVbL5
	 4T0GbWArQsEyhUoqVvlQ7Z5mPvubZEVMWrEdGwRQFhZsymzX3x+2sn1O+Fl0zcqxz7mBc
	 1yx+JYUgpt9msx7Hm9M2SDN6Qh/fPaiL9ftt94RpScIOGkVj8XacZPcZpdKfz+7WCmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
	b=g79+ump1lKaB/++vXY0axIp8Ri9UNQnWJcWMt/h1XpNSwpy+ImdMM6RYmIcA6TNWJs3n
	 LlRcIbQezobQMASW7nPVffJhV68raWKiwd2K73QS+VJuVgoqFo7vOfvO//cckc41o957N
	 exhbL9nwHIfBP5CEI52G2zxI7m1jun2YJrsfuqdW88VjY3SnrNzoLQhuvyL7mdWW3HITX
	 p51g6HsJEUYdu9KpCgiZKZPQWsL5oXj6fhTulvXpUYEqO2ZXUkCcnjYY+5b3gWePOEd5U
	 r7WYo7aFbfxhIbNiTIGy0w81j9DZWZRwzqDrBTObQCKGBJfBWSUHwcCMUT7d6xb2FFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glgdVVlb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SmfRt1o/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1E606A31E
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glgdVVlb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmfRt1o/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS2XhG83658698
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=; b=glgdVVlbEXW80Mx2
	5is/AiQPg1CGXsp5IZgNFFJrWY2E0bjzOr/WjJPWYJg1I9EUtuuwX/EzHUk5Rq3h
	MD0u5JbHsW9dDY98hiJU1xPxvv7dvaq9hW0TPISFntdH69pS9VWe+3pzYI/R+II1
	d6T4wybWuhKaoxmz0MQ78xZxdBgdTm4WDSz+HoHOvfcLRyzV9NEuvXwao5uN+HrX
	mqw2bWr9ty4a2BBMLwRA/DbW9AOQYVjoOP/BjHmTem6L6JUNKFwsuCw6OnJYG0Va
	Shwilxs2lXH7E9tVnIloYAlO/oeCLnsG8qiiUjkunRMt3weIBeaA9QGfQzHS45uW
	fHn3Bg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7p9gg2t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:23:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so7369939a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795836203; cv=none;
        d=google.com; s=arc-20260327;
        b=SQIVYqJ/hyMBvFJC+i/yxcXNxgXvejL+b+tfNH6AGGJfb9Sc6c+YJVmpxStIGofioQ
         9/vO4G9keZmkZAFNxo+gRTl4kwIgZJdiTiNLP/5tY0e+yQW4tMZmOnd981x3DatqT7vU
         t2crRBbVgCFlwdFrWq3KFK7vBoD3Q6xpTenE4DmoT1y2bGg+Qt5Zi41qiAkFfKAUo/ip
         NEp8JTJdjiTTgXEZF2cHVViX6ll2OEQ054gRQWjz8pweYq4wVeKyEq0eY8vAFzWCfdwg
         hLdLBlu0wE9bbCLbtuPrRDtk7YlMq4i3TPxRJsUnpxtRSlQIWB0NdoTYpqsDVPH6nimb
         h75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        fh=TYZtRSJSrRzR5UZHbjQrxtzAVHKkwfdPA3E06eXamcI=;
        b=sOckQqjWnQuotzDjyx3uEPWdKV90EctBr3Si/2JuN1p8AmcO8VI30URqesufcolnkD
         OhKgq/zBDW7SIN9Rq8NnePondjDc8oihCxycJOUvitgVS23er1J/ECiG7yLi9dG+e7d2
         viOucVwoWDFoiI2/zFGQyEOWr9jnL8oaSXpWDDq/BBdF4xaRVDtU0HGGnH6BbB8ISVYa
         6D3KxuXvcJQorYkuG/OUVmckMPbt5APH5dK4i1vVb81GwBAHQDroNwH6m67zAb2dIt9E
         3jlkydOLqwF9yp32mNpO5mC0zN9xFlUBr2lBXrrHFQV5Iw+dVZmxQI+XmU9XaZvpWV0a
         swOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795836203; x=1796441003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        b=SmfRt1o/4Baa287biOyZWvO6I8Ho7i0flsEed0gzE06/BS1RPXpK6c0NzqpkFn/GpI
         QOtHBXkTJfPazZTPwg7vCLTt5R5Cff7iNjxHGNKNyhP5U2FJOjX39oMYv7KSLynQhySf
         BGpAOrN1mXDFJ+lFtznCIo+eZWe61IQdYnbro/wfN/dz+sRk/GjfIVEpW0jOOGdcE63r
         oXDqHp76ZRJsqsJRzgCE2FBJtyiTV4ueVCiknq1CnOznncF1LkchYUiIU9YDYCHzl2Gp
         VsIrWlUrNhq+SAWxQ7iSj3X1DoiZp2J8wvc9nVprlAnMEJc9hGt2rS50PfrbLU9l2xhg
         tnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836203; x=1796441003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        b=VotJz4PTGwrB7knLEqKfwbEVqeiWCgTnTu/aI8W6sIu/M8D0+DjLCwIx7L6vDmej8u
         p/7ddc+SzVN6rRshE42J4Ygk9OtIcjUurzXb3Pq+51NCIvGwsjkLav5V5OgxOFwogs+A
         ceS2ONMEkD1eitxLU2rrOT6JONJlxCQTS1GwnImmynB871z9zOGRoNuMwEDmJ+2gJURn
         PThi8mc4A1M7Bu83lJ/FhHDic9oJPVnTKtEcLlBv8d+yzXI98y4p3zwViM+IxepVT48S
         qJbExzJpzv7Ej6u9H1BNRcKcbXh5nevafRTwQywkx6HJQsr29puHyJFPGY1FBLJWqoQd
         nbGw==
X-Forwarded-Encrypted: i=1; AL+hErGlYlhXDUydWMkbUGEvAwKgB7OfZqYkWCx7N4ztHvCaWAkzDaYOXsJhGCRctaz7JW4QO8Ski94ollN2@vger.kernel.org
X-Gm-Message-State: APuU4Z+K1eunhea3USRwPfCpbfJXdMLReE90EVXJ8XdA2be5zZ57sW4A
	9XPShqZh3gtzDMQzOUhOonLVW+yG4NbUXXeyfwHf5D7NHq65crMCOXj064Zc7gK4e0iiJyBRDym
	ZRPmIJ7KCC9iApJespnkNmjNVeEv3m4HUQyY8E7/WDSshIaqT43vLAIVWl2xEMKF1wOiqCmJ/Br
	LEzp28Zth18jrTCEyednzPunrH3puweJ6a1n55j7I=
X-Gm-Gg: AZFdTZexlxV0pCfJ0CQsTSVbOLoWZrccylRHbbqO/uFFND7wiRbfXadGE3kCOmfcP0Y
	dPiUHHXQaNF5kR71thm8S+AE6laVn3J76MH+iM+OQjwit84xL7LZ+umxrZ8yc7LHT9DSeDI+x8P
	JG8/kypBHjo+DQFhRGdPJAHx4BvnuZPDC9HeiH/oFEVtY6K8Zct4DitlhjLQ==
X-Received: by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3b41c7ac351mr25294738a91.4.1795836203101;
        Fri, 27 Nov 2026 19:23:23 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd with SMTP id
 98e67ed59e1d1-3b41c7ac351mr25294717a91.4.1795836202652; Fri, 27 Nov 2026
 19:23:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com> <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
In-Reply-To: <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 11:23:11 +0800
X-Gm-Features: Aa3M54pdtHVhMPiDpwvZpA_yiFjD9XBk0DLdxrb9gqbWX-5xD2AirK18RsI_fKc
Message-ID: <CAFkd8huHCnXbkLhjVg5_UW-1zD9WPyoogBKfmKGrdQYzBhD8zQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BuYIUoX5 c=1 sm=1 tr=0 ts=6b0a492c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=dn66lLI4fUZHpx3frZIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfX+QoXhLe9Sytr
 +71/nImx3CPckmpOx1gyP1XDBiLRTgM4oPne+ela5ubJyvV/6Uy8E7k7aBn9vArG6eigJC3ZODf
 j4jJ5pldUzrWSamih63YJvmXL4xQ2Wg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfX1rAHfJnWYNmH
 bszQTbB6yXCoCsVV/AwOM2Nwknt42FAfGIxuMEaZLx78VSmKNsQ/lZ693DvmenSHC74WXNhD+7c
 V61vwRiP8dABYAbwTJHY0eU6l9u0ZUz/k6C5Tnqftd+OIoQCiripRaCfLjrRd8Mo1Jfc0UVJpGh
 MwHTPZYmcB8rLIWKfHS6J7QsvUT7Gtf39laEuvbOvRP6rA3V2CCOC6rqnmsiRR5q78L+E4pFWms
 1rwSX5SUaoB1SRlMKs+GuG6QVKM4YzYOLg4mL6PLwzNKhc2OwEyipi+q0WNnyM17BZbGCxEzEBO
 8q1Nmc2PycbzbVAuuXj666/05ycGL9rqsHWMG3rg03WmGZG5GIfHeEycuzR7P6Kf/cJyiTBx7+E
 Ymi55hLDswpmt4kFFzrg1pY5/1dKhY/LP4gzmq6a3yKqsQqqRbfCY83+vLr5LKqlaisQ2xiw4Pb
 JYJwnj2EP6tAcEpkVeQ==
X-Proofpoint-ORIG-GUID: H2s1OkF4i4AT2mfWMsFDvke38I1A8VIf
X-Proofpoint-GUID: H2s1OkF4i4AT2mfWMsFDvke38I1A8VIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_01,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280013

On Sat, Nov 28, 2026 at 10:40=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> On Fri, Nov 27, 2026 at 07:33:26PM +0800, Zhangfei Gao wrote:
> > Nord exposes System RAM in the upper DDR window starting at
> > 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> > pages in this window are therefore treated as unreachable and may fall
> > back to SWIOTLB.
> >
> > Widen ranges and dma-ranges to 40 bits so capable devices can address
> > the complete DDR map. Devices with narrower address limits must
> > constrain their DMA masks individually.
> >
> > Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC se=
ries")
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Hi Zhangfei,
>
> As you are the author, I would expect this:
>
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC seri=
es")
> Co-developed-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>

Sure, will update, thanks Shawn
