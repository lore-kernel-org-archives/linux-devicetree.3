Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794237206;
	b=Jl/ex7D0sjGKnHBe7wHuYi4/cCsWdde88j6eBfQdUg5Eo+4GhPoP4KhS3njNVkn4ZlD5
	 nb1PYktt68w7TIFSgenhtnLkiCym1XR4B7MoA9CSTIOR8iSQNoMxX//bRreJS6t/DRz3j
	 6t2cg0WxUtCedC5gmzFPiO2PBzm//3qrqyyNSmvVxA+6Hq9dtsqLQMYNcgvj3JuTZmGiG
	 JwJttbkHrTzbpnnaGmOTsmA3meDDJftbZCqyxBUl3hAwYfDYx7M5ufoqFferAdNE+RuAx
	 xJwzEXhPMvPCtUCd7ekRXxgEqfXNfWBBvke2JHBvuUAJA8nl4wo4+73u11CxImHm7fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
	b=WFtQUrx22x6Kiyni11XC1cKmKkylmr0YTOetBV53lC5664WHDDSpq9gldA1ETcww0RgJ
	 XsOPbFeSCelZZhMTV2YxfyMlE3KWCgotM6jJmmwO39qr044BfzLtIAN1Jhp8lMSq+4a+s
	 U57eAJb9bPXbINYzSJKdQWuN9HADTBjot6zcFJIB0Aqya8aSrHSeHKEoaPa8gY4e0RARU
	 AOhuRSsrGwpDSy/T3mmmIEXqTsK1IjKr9/J2AhR8DM/Tp5qtTjQTLheZ+4XIshRPFD/81
	 Q2lEAZeFoGBLtWvDaoTDHaRDfjb+ePENjVsnrV4sC8T9dgDKp39OKqDgYRjiy5LF72w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALf1fyLf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F71Q4QMP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCA606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDCA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALf1fyLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F71Q4QMP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDfD310894
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=; b=ALf1fyLf2FjXdUoU
	6oeeOPdFeB1HyHQDhDkeN8ThA5C1tMT2b6TzcY6eT8wxJD4QoVVhh/M5IZBWRQmm
	ivVbAHAZv0MpvVkNN9khzL2abl1xU3wpzbKGwZQ7+lEtc3vVJyDz/UZ+Sq8AVATI
	o6qeLi08z5O5iqpANWASXnXDpBM11cuZ53nWnxtmoo3JlNYd7t8ViLyDskJgzeWD
	NpihyKfmsSKPJ4E8MZGT4ptrRGxSkVpR93BJlGB7ApdqQBkqpgw/TaRi3yd8Qr4I
	h+gORQZLHTZtFOMn2tTvBg1OvzpMh1QhBWznrWjEnt23FMlDI4lx6Q86OrXaoa9o
	ooxlQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8y0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:13:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso131681a91.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794237204; cv=none;
        d=google.com; s=arc-20260327;
        b=XOi8JRivjC5AnQcVWVUIa/NDkiIhhIDZbKt3E95UVqe82+IxQ0FzcW4hfE1/sJGSco
         oRcXJqPkxf2yiC11GjzX/wCJ4Ax/ozQOBEFzmB7RBBZe7eIozSVkJ7nWrwsaSSs4g19R
         ndf0jcmu30PAT5455sS6zR/JhEBAYKHWKRPtbAHyvU9+TvABszuD/jIyYQMjnuw+TRkh
         G03KG8lFjd1jlCcdz3zWU+No+OL8wd1Um9z4DFhBYsBxNzXtBxi/DIKctuUJVsT//tAh
         uGyJepABgl+lWv0OFNt8/Y78ml/IjbAFo4WUIKjewfzSzg4bcvpYi0WPs8aLYzxWqNZZ
         GcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        fh=7Q+XAXHyt5Eq5YLJGjaBNHrErqaA2KOne2oCA/NbluU=;
        b=kWuAFbwnw/3mq8fJDXg/lYVNvgmWlIU4RobgTMY/NWO51pDhFDg1ZKsNApihW/QWW+
         5TQP1LXD75EY7fsd1w9osgigNXm2+GypmZNXeLeoouqR73L5fIKGnl8JmWne8un+Wr26
         Znqk1C6P6kKd5Q+dajNm8zk9inf2lhK4zKqMy4eIvkTDFC155dCS9SW1+kjIs+PVq+GB
         ueXfcF7ki2yRFXkLhGNpZgNEsBB+yz03lQAkovI0qE68kI0kQYyxpPQz6azgMcaMX9tl
         vdCZK1r6soLv4+5lyqdSTwYvaCC5nSCVg0yRohFnJRgKxTdlbachVlD885mNN9alAptU
         9IWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237204; x=1794842004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=F71Q4QMPl2i6nrVcmYPZGFCmL0uUxDpjvOy2QDSsPwmHOVRCzUwBNPyhKb1BNoLW19
         CPF0o/r2CFDEbnaEbKK19NTFGlqqDZp20v9LEPeeX18ET0nBC4NCSsIPVpvPkLgN6jwN
         VBg+gjmmEPxRUpjco6aylVUn7dBp3mh5GPMUiorNrrJsWcrnN0wofwbEyN7yxzfVohRq
         tUMtTvacGzfVKuy8yiG2m5H6XPMCqZeRG3akSlki6KIbJXo2RydsyhGaKiSOAj3CuQvf
         vjwF4uXyQbt4CFmOWG/CN11uweG0BgW5FIGa1QoMQT8jcV/dNaakUPUA6WdwipiaIEeQ
         V9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237204; x=1794842004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=Suv5RKNXGpt+JUBm0D73YseV0JQUEt+O4k6cmfuErfZOH7ng4piW8wr9Rq6NiULoax
         iIFMnegwk5hWrw9T1Abqqc6rqiDC5MYsw12pLEZalAtko88jkrtgOHq3PJkxgqiXbizz
         47BaHwjZij8l+kXIdt3Mv/ZUTNPfQta6hyDTP8+no4f0ykxugVURqohbpUW8kz/hjXL7
         yGC3OTY4TQG51E+rJn+CGLdbvB8s3v8IqIwxNLMVSj0J8B0vJCSBSziVQkAhwFAgGn4W
         lhjJ4KOmCGd7Gpi/1hT2PQBCKLA6ZMp4LntZ8ed2CZ3KvHXnhLqjGBREoqhse5CDFiFW
         9b2g==
X-Forwarded-Encrypted: i=1; AL+hErGdZY1EssEF32sVIe/XMy3Qb6BBgNA4Jdu/rxl/iYyhC3awrYsWxLsC48uusCgya/9M+fbCGhIApNg5@vger.kernel.org
X-Gm-Message-State: APuU4Z/7EcH4xfx9/LpqBTynKVmkQipx5OKOtu1BzpZdfScrSSM9SnkM
	/YSZQk6hnSfPgNCcu8aIrpJr7UAR/HSozoO87B0JTrc9ILIybNkKCe0pvgET3FunHmufcVwKcRt
	YOkGP2XoRvXULoBcupg51w4HRtY94RvBLWeLTsi8z6n3W98FiiaeGezqFm4Nh1Cb+Z+K0QrctLe
	J2rjG/pYCLJCd3EsxHTXAxqCzCYIbTnzouoc1xhB4=
X-Gm-Gg: AYBFou20xuh1Lmr0lw5vKTaY7VuE9VeebTdbx0TVdlf4P54O/PH1GEkx/H6wIU/+mVh
	LZ+tnv9qnybVHR6PEK2LcZ/ZByUas1rBISeljwURCt0qF/3fdhWCtiXquB0h2lUot0P1DonFZyW
	jM/fnD4hHohn2YO2aQiw66FHTCtvlAfQsYGFhYKhvboa7zyDMdzCLw2NaOqg==
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b12d33ca53mr3640817a91.32.1794237204183;
        Mon, 09 Nov 2026 07:13:24 -0800 (PST)
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id
 98e67ed59e1d1-3b12d33ca53mr3640777a91.32.1794237203488; Mon, 09 Nov 2026
 07:13:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com> <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
In-Reply-To: <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:13:09 +0100
X-Gm-Features: AclHuK-qxobxprSMzZBUYKJj_uyReksqIyxGSuqu40gW9TvUywVmIwdWYsE9eVQ
Message-ID: <CAPx+jO9-fANS=WN74rFz=dFZqE5PQo9gDcqb1A33W5ohEsbevA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: dvfs: Add RPMI performance service bindings
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, rafael@kernel.org,
        viresh.kumar@linaro.org, ulfh@kernel.org, rahul@summations.net,
        anup@brainfault.org, lftan.linux@gmail.com, alex@ghiti.fr,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXxVnw6A/xtJgV
 i8EiLSNhtJfDyWq7rixakJhMrOCfFLZfK6MPHGr7SXsdmoRI7TVj/UsBjrr09XYfDyj7WwEQhuW
 6tqJleLLeQVIw3Yj8T8SeYEYvhebHRH9U7sxkUuU1FyXeeXGQwWLLRMIZdqpu14gnKRoMQkh5Sh
 UJEDPFd1bB0MmsOt/ojyFBRQWP3qryRuGERr32HvEzExwRCUSa9+unuDI7FoqLR9/i1kj7VMY26
 DM9CGShbjHEhpscRjyR4ZiQfPdNWMow9oms6u/9HACoZQWTrhg9DvT+B3Pzvad2jsRI20ApvTDD
 tZiKzyqoDJgZM2j4o7xwpCgTI6LVnJE+Utt2ryXnCmw+dz3Goflq9k338oOSef036nE3uVBaLFT
 ZzYHviNpqr3Xxy0nUCpPsgdmSv++S72oX/s8LfZmtPWEajuXYzgHluAgSekm1luTPSvrHGszz24
 JbMBnl65enaGm5OJzNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXxPF5yCUfTBgg
 KNNR0DJQyMT4CPuNPMpKMaEXBzj75Ad2IpAPOvOkAUrfqT396LfX/dp9+WMyy/uRs65ACvyAASM
 LpA0wvc5lEMcCidTd+A//vA8m899FhA=
X-Proofpoint-ORIG-GUID: NKW3JqAqCnaSMIuc5_ufgyyVrT32Npyf
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1e315 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=Bq6zwJu1AAAA:8
 a=TxQ1F8pul8oCGEKA_3AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: NKW3JqAqCnaSMIuc5_ufgyyVrT32Npyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On Thu, Oct 8, 2026 at 11:12=E2=80=AFAM Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
>
> Add device tree bindings for the RPMI performance service group based
> controller for the supervisor software.
>
> A CPU names its performance domain through "performance-domains". Any
> other device names it through "power-domains": the controller is also a
> power domain provider, with one power domain per performance domain and
> the levels the domain advertises as the performance states of that
> power domain.
>
> The RPMI performance service group is defined by the RISC-V Platform
> Management Interface (RPMI) specification.
>
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../bindings/dvfs/riscv,rpmi-performance.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dvfs/riscv,rpmi-per=
formance.yaml
>
> diff --git a/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performanc=
e.yaml b/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performance.yaml
> new file mode 100644
> index 000000000000..ec7856cb7257
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performance.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dvfs/riscv,rpmi-performance.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI performance service group
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a modular =
and
> +  extensible messaging protocol for platform management functions. The s=
upervisor
> +  software can send and receive RPMI messages via SBI MPXY extension [2]
> +  or via a dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines performance service group (performa=
nce
> +  domain) for accessing and controlling platform-managed performance-rel=
ated
> +  resources, as implemented by a platform microcontroller. Supervisor so=
ftware
> +  can interact with the RPMI performance service group through an SBI MP=
XY
> +  channel or through a dedicated supervisor-mode RPMI transport.
> +
> +  The node is a performance domain provider. A CPU references its domain
> +  through the generic "performance-domains" property described in
> +  dvfs/performance-domain.yaml.
> +
> +  The node can also be a power domain provider, with one power domain fo=
r each
> +  performance domain. Any other device that runs in one of the domains
> +  references it through "power-domains", and each level the domain adver=
tises
> +  is a performance state of that power domain.

It should be sufficient to use the power-domain DT binding to describe
a performance domain. See
Documentation/devicetree/bindings/power/power-domain.yaml for more
details.

For example, a power-domain provider node may have an
operating-points-v2 node, indicating that it can scale performance.

Kind regards
Uffe

> +
> +  For example, with the provider labelled "performance", a CPU that runs=
 in
> +  domain 0 and a device that runs in domain 1 reference their domains as=
:
> +
> +    cpu@0 {
> +        ...
> +        performance-domains =3D <&performance 0>;
> +    };
> +
> +    gpu@40000000 {
> +        ...
> +        power-domains =3D <&performance 1>;
> +    };
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-performance
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#performance-domain-cells":
> +    const: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - "#performance-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rpmi-performance {
> +        compatible =3D "riscv,rpmi-performance";
> +        mboxes =3D <&mpxy_mbox 0x1003 0x0>;
> +        #performance-domain-cells =3D <0x01>;
> +        #power-domain-cells =3D <0x01>;
> +    };
> +...
> --
> 2.43.0
>
