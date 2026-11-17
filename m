Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885344;
	b=32chjwet39xZuZ0Emb/joAs2SkAOMttGKqiGg+2pcQV2AkkdxBwZM0kHLLqOsGrOk8yP
	 uzhGewlN2hqHhdepGG/pJpAoUuxoqWaIDPFinpQvhOSxp8aDrIhMZM7B7JXQ3kCzdJzvO
	 yLdfcXDnORYpWnQ+wRV8H2T/UEKThcBdozfCN5btZNKYebL+AuLBKnefPuvluvAmVBdny
	 scglIGZ34KPPDJR7mfUesLoduXi5DvD0Ze4w0cpLUqfuB/qyNd5lewihEGSQnGkNQu/Wt
	 WOEtc2p1U+ZtVb7BZ3eohswRu71rxd1YJHGjvY6xyXH5QMinUPMIfNIt/slIh6ZiVkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
	b=gLGNC7s061zaXna2WC8xl3e1/L0X3r+cX2NuMJUZYiOIyWjfEVsXNbvld8wvfPFvOV3z
	 z3bsNLlv0nP3CGd/nykir2boDwm6KHGHWksaWQ4czmvcwyfjsaMuw234e7gcziFlevQma
	 fW5622WjeOxV2AoI2Gf4K26AxW4Q7buHtR7Cz4C9yPMsOq8HpYPhbb3av8t9I3d6xTVfo
	 wtc7uAhhGl+kAvYAzXiCwGh1VV/6UhWO1Z162aHH5ckR0/eZJjm/UlKCcjUvU67GuEiwJ
	 3EMsF4rGTXWdCfbrbBebdFc99E4I94OsthUrt5269Bwb7La3MhjRNCaLDy4o59IkOzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fy41sJZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aWAawD/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB09606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB09606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fy41sJZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWAawD/1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aIBI1507768
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=; b=Fy41sJZh0beN28KX
	xLcgYkVB2MgktBxRRx0+tY1tyDXgiXERzfJsEHKOCITg2F9EpENQ11Ix8nKpu0es
	knm8GjT2BQZExYwTvk6P/5E7r7kVoDG8c4GrwWPs10a5oiuJnGEIq2GiKsH2BOJw
	f3KI7pVRxIPOLgkwWufbhM3pBhgpd50v6+SuDVa+bTwcd6TtZjpJD4hQjkirGRsD
	p/sHDZPWWuB+VbxY9cEVJXrKx+mW2Md24g2sf+Ja5ZwYu3pGwuNZo0IaMomsuatk
	yE6SXi+k+eItLg2FGots+uX4wbF7z7h7C7P9L8xdPJVILSr6k+nDG0ZB952GZCQg
	Olov+A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gksq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:15:42 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67daecab1b5so2547423d50.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 19:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885342; cv=none;
        d=google.com; s=arc-20260327;
        b=dBNMrRVFIRqiLOnSUzlS3VE2E7bOGA9uRb4nWniFHANs00rCgA9AkcqDZd0ZPok0vG
         ouZ2uXhlCMKG24atcKggUDvP4ERwCRK6LsA12RpfieYb82t61sYaPWOX1HCDLlKRFviy
         Yzpa3YVqJVou6vMcvtUHSuoTVb5OivdA6B2gN53VoO45LRoBiBiNNsu/5NcNvRY13ojC
         ajXazsk6vVeySu9MLarUjkWnNWPvr9RFmUN6eVE7KDu/cCpKtQ0iT8LTC6IhmAnnr+MN
         VABb2Uu3CnB348weOqXay0z2IaNhBksAxztLEPAhR8hW8kKy+UKeGk6cUo/+g6ykDr3j
         MjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=F7R9wVslBklxH2et+R6+AsCXoKMKLHFUK+tsMgIJ2NG0hd6VTsUTNwLDFzAsQGXE/I
         TQM/o4W/Oe9EkuvawcSMh4oCvZOOrSAUpbcxN9Qq5/0I97NS3rbTDDN6DXFHvZkCoLtv
         HKNKuakGDLfTX1EXj6obwpVoS+7oIzavYfWCsmoYefzI4/g82Qb37xABmXO9/Sf8QzPR
         oFPZ7FWp9h6ZD/aRKG237dxZAnVNmEMHg2Ck5XwPQvLSHUP3uzbXdoT6gHwNT0cRMfJ6
         zpS2VWdkCypX33cuR8WXcV3r1qvmHDFSHDFecl/54YddOBeeEpM9cgHlNIpEjAh+yI9V
         AwVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794885342; x=1795490142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        b=aWAawD/1/Qa0LWcCLgTrYB+1HWt8lfmHuyPDvUPc3stwkb8C/M6d8Cii2+sFCE4nrZ
         jtlE4+cZ/LkFp+pxPMevX/pJmM/E8IRcX1oV3WLpBa2lcvpP6C9wih5M3LF4ahnEU1YT
         k/oA1KS7buKJpahmpm6exwbtOkqvIffA9cM9+7f6F/xv+6HCaHeKPUAm1dogQip8v8z9
         JbW3YQoS8dzqqoOdM9rv+Y12PWqonqo1uvBrs8VTXsv5V9OmfGz3pymFt1GRR8ufZu0t
         7t0Vl384Co+nDLV9/78QNeGzoKsPFCmFZMGweBxF1r50mtu1VJitLWD4N9GMay+EBY1G
         R4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885342; x=1795490142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        b=NPegNvK6OJKxPS2lzDuGjCA+keht4+hicPwrBVvQDoV80QRfPDPsmRCfnQvIrYrQ9o
         8+Eogrt49Tr0sjNvOYKm18mtdLk85lfcsf5qmtXQvdcN+Sh6siVCuanjvjDc8Ew9urL9
         QI9C3ogW4VK2Db/u9j2+8eu/AnDMGN9nJAGZTj4DoIZgx6oKFS/JbZXO9izu4XOM18wH
         Go7vJCW19RVa/bFkh1PuH76bp57gb4pkbQWiBk7DxFiWkbyAuFLd6pLp6ZMXI4BPtgWb
         04/5tB0ULJOdmq9FFudopRE+g/Wsa1ZkrPZp6SRS1riTGdXm26/Gh9xfNwaokOxYND36
         kunQ==
X-Gm-Message-State: APuU4Z8rBZb82CAtLZ0/4zkpr5U9vBQX0SH4ALqP6acffHtlZWI8UH/w
	gmI35CCdCbTGczkW44QE5mUl2Tj94uFg/A7A2cVzZq7pabeeC6lke8e1sksBYfCPvF4MJu7Tg4+
	D0Qv8ZuGpXx63c1JI6tn+LZ4Vrj8RL7aZxp2pFqKJPY0Wlk5EZ/kTX+w7dPdvpG1HTswxiIY+DQ
	JQOoRZ6CxCC5LlaQaylVp4Sm4ChObeFRJB0i9XwaM=
X-Gm-Gg: AZFdTZeOuw3s9uo1rGOXDXeaVCEk7z9MuowETBU8GTBIrMY3TVmpp+BGjGZc1RyoJeR
	TPW/NxivfX80QaJckaa44Rr4bzmC3KO7yEQJc+qjdB4cFS3PQN4LI51cWxEvCwl6blXxxBp8sEo
	4Kf/4jfikYyztMu45aEEifKPWK1ZzW/YH/njr5/TJsC9HI59jHTFQB11GlKQ==
X-Received: by 2002:a05:690e:4181:b0:67b:ea15:ece8 with SMTP id 956f58d0204a3-67d89771ac9mr6846268d50.101.1794885341460;
        Mon, 16 Nov 2026 19:15:41 -0800 (PST)
X-Received: by 2002:a05:690e:4181:b0:67b:ea15:ece8 with SMTP id
 956f58d0204a3-67d89771ac9mr6846254d50.101.1794885340992; Mon, 16 Nov 2026
 19:15:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
 <sashiko-outbox-216098@kernel.org>
In-Reply-To: <sashiko-outbox-216098@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:15:29 +0800
X-Gm-Features: AclHuK9x1svYbe_tchpY0HpLjvc9kttSRHHjY6uu8xpeTHuO5qWPVBBgBjndyqE
Message-ID: <CAPTcHHTwky0jGtG28TMCVRhV+VdXnnwyMn-Z0u+-Y2hujQdWSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfXzNuIfs5hYBLO
 +xexsiJNmpFGockpJSrEtA+nwGU2jNCy1Aqpoq8SZEUN6RDMqRirZoPwnZ9FXd0ODuiSfTVhf6X
 2Je3k18sDvZTst8F6dTGwImRbWflTaTqEW4wo0weTQhuLfDySBkFbASU4eZWCdYdOyDyT93kx4j
 RonQxqLkJmZBylldinc6/cRVvJhGARRA/yhBIfUYkd6pcgU5UFG2GogRvM6Q0s/BI6WPgQVP5Cs
 oIuJvUWahzR5Q5NTM7A1RCpIyRt83hVSqTCNZ58f5KaHdvFoU1eq5LnuMw3dJMu8EQw6R4hZ84w
 4xRQrLIqk+BPR+6q+wfW18Kukrdic6tY6McSbufO4JuKTEOKGapJGYB6NbJElXGQ/Y5vfi5PVXt
 UZNnsN/bt8Zu17jwMHH+KzFMQ6JOcOX1Qgx+bvz1zlx3PJR6ZPDDTL9aDBFz4MQefjGG8bWMno1
 Li3M8uc4DbxWowCRv3Q==
X-Proofpoint-GUID: 99rTWJIEp5TjrIOie00bsPA-mov0Ys6G
X-Proofpoint-ORIG-GUID: 99rTWJIEp5TjrIOie00bsPA-mov0Ys6G
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afbc6de cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hCrUwOQTafd59ZRO5lEA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfXxOtZ+856Y1QV
 APbkOdJjg1cvMqLWbSPhZMa0cSsWjgO/1cAFw7CX3OwLGv7SIKQdfRC9WmqctynXt1rI6JINSuP
 QGwG/kJO/etPyYJlzO96d1fJK0YFHPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170011

On Mon, Nov 16, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
>   beyond reg
> --
>
> commit 66779220f836f809e1148ff64ede0801ef303fad
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> dt-bindings: nvmem: add byte-mask property for non-contiguous byte select=
ion
>
> This commit adds the byte-mask property to the fixed-cell NVMEM binding t=
o
> select non-contiguous physical bytes within a 32-byte window relative to =
a
> cell's base offset.
>
> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..46e1101ee98ae 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,20 @@ properties:
> >          description:
> >            Size in bit within the address range specified by reg.
> >
> > +  byte-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    description: >
> > +      Bitmask selecting which physical bytes within the NVMEM device r=
egion
> > +      contribute to this cell's output. Bit N set means physical byte =
N
> > +      relative to the cell's base offset is included; selected bytes a=
re
> > +      packed into the output buffer in ascending byte order. Byte posi=
tions
> > +      are relative to the cell's base offset and limited to a 32-byte =
window.
> > +      The highest set bit must not reference a byte beyond the device =
size.
> > +      The number of set bits must not exceed the cell's logical size g=
iven by
> > +      reg. Cannot be used together with bits. Cells using byte-mask ar=
e
> > +      read-only; write operations are not supported.
>
> [Severity: Medium]
> Does byte-mask redefine the size cell of reg as a logical output size whi=
le
> allowing physical reads past the declared reg range?
>
> Any non-contiguous selection of K bytes has a highest set bit H >=3D K, w=
hich
> references physical bytes at offset + H outside a reg =3D <offset K> rang=
e.
> Unlike the existing bits property, which stays within the address range
> specified by reg, setting reg =3D <offset K> causes physical accesses bey=
ond
> the cell's declared reg range and hides overlaps between sibling cells.
> Conversely, setting reg =3D <offset M> to cover the full physical span M =
> K
> leaves the contents of the trailing M - K output bytes unspecified in the
> binding and causes consumers such as nvmem_get_mac_address() and
> nvmem_cell_read_u32() to see an unexpected cell size M instead of K.
>
> Also, the commit message notes that multiple reg entries would require th=
e
> consumer to assemble the value from separate cells, but multiple reg tupl=
es
> on a single cell node (for example, reg =3D <offset1 len1>, <offset2 len2=
>)
> describe one cell with discontiguous physical ranges without redefining r=
eg
> or limiting the span to 32 bytes.
>
The choice of reg =3D <offset K> where K =3D popcount(byte_mask) is
intentional: it exposes the logical output size directly in the
binding,
so that consumers such as nvmem_cell_read_u32() and
nvmem_get_mac_address() see the correct cell size without any
knowledge of byte-mask.

The physical read window (fls(byte_mask) bytes from offset) does
extend past the reg-declared range, and that is by design.
nvmem_validate_byte_mask() ensures the full physical window stays
within device bounds, so no out-of-device-bounds access occurs.
The overlap concern between sibling cells is real, but it is not new:
the existing framework does not enforce exclusivity between sibling
cell reg ranges in general;
DT authors are already responsible for the hardware layout. byte-mask
does not introduce a new enforcement gap.

Regarding multiple reg tuples: I will remove the "multiple reg
entries" statement from the commit message =E2=80=94 it was comparing
implementation approaches and was misleading since it conflated
multiple cell nodes with multiple reg tuples on a single node.

pw-bot: cr

Regards,
Hongmei Xu
