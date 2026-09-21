Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013284A0929
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001173; cv=pass; b=ZdkTRS1ELrFMv/zuKh9UMN9vPz27H5IwAf/C7iPA5ZlkHH659ZzGZK8ny4iB+zH44FoussulzlZnaC1mgKmgjXeV6SEQzZZkPLreAznWeGIdHlMptGcy586/cx6srgbutcrsaIcpCdin27ybWw2uFxVNeoXxykdY1AEFODRLj0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001173; c=relaxed/simple;
	bh=hzsKoddot+dY0EZ27aq5GfZZI/Lez7LJqexM7v1StJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPQ4igiN/olaCO4OCEUwOWp5t0xRo8XezsdjoGi7LgiAjPKi+pjeg5EsHbtocivVzi7NMQRdcuEbbz8/V/JqvAL17HqHTA3xy8GDsgmo4hgy9nzUxbf8JuQx/kS+z6IAW+HUbh3/Dtcppr5Pc6ZhsY21/853XrHbeqrM+SNfKok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhPDDERP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwHq1vyG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhPDDERP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwHq1vyG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGPhv2404092
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=; b=IhPDDERPEIKbMFAd
	g4ug9QshGTwL0pna643qpJ0WaDvB6HfRtmpn9UQ3FmOO9xhx/lpZOMwF1GyOPPXM
	EsZnb5K7B8VtRS78CS+aZAXx+s9CXPeSCAG/w4sCEmgmifFcFnKU+utbEWQ3gGEf
	TiDyyAKUSJ09MzWPAgql/ZJuMpVYIFXkWr2Bu6o9kRqrfxfPQ4VxftA0Jh98sb0W
	jqT7GW/y6BxcOHfO6K39alWyOb8uJxDptadWSHP/rxq44Y7oTGNpuzaEjjarvHLp
	761Qz6vDg+47aHh35c+cNwqqwgvfFiholHvdXhvm8mJ2BPrUyxkqvdWfwD2/xiz+
	mAmeFw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vauuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:32:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4241826a12.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001170; cv=none;
        d=google.com; s=arc-20260327;
        b=dL52YhxDN+1HBlcZYwUoKqxFBQVcBO7TskGvDvuXqZsbcVnSoCHRiDH4Ko0En9qQGh
         C+IQJZpQQGJ54wQUR/8FZCcOof71eVZcdQzcll0FA+H5ROnIOIBjaCPSeMI7q8zYZug8
         WLZ47bZYlf0EYn/gOElFvTX0ad+EH1TEPdL7REKCuapMNb07jw+EqFxlBzCMoBbSMTeT
         M0tJfxmfLbCw/kP8LyGbghjA0Eh+y66/qiQ/AtH7fjc52b5HFM16/Bb5RUOYWg1z1uKp
         RZTuXiwL+8DI5JNkFx8mQ/sF7gelc0sHWAW+gdhgSS8lYK9x6+j0OVZFXJlS3kIUpixo
         j32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        fh=IWB1DkvNR1mzsguSsdwLMEICjx8sMNf0tFhFxtLqw6o=;
        b=msCiIujx0OSrsvQErl91/wVAZDRm0OFJ7f9jZUNhSQnqlZ5/kUnSn8tFW+sa2+seGO
         7K7oZaqQBVboBIwmyd0yMFWeqsD1cBvgAjr6+T1Ak0mWSS1eTo3dLGg4y3siZj2hM48k
         1W9brEkcjMfscMd7qmnmrY7T5VOgETnyfs3QBmUuQu/iCDwEFIYbQehWtsk7SIHAlwM8
         BRE0YuLBxGINtbYMpfaUlyd2iuOffbUIkkj8ZvW9zNznTepKgl8o5mZr5kxQLZxybMQS
         OdgWBtHPu4fE9IHAESZDB0URxM4glXu6IbRyeG/GNiY8g0b5Q+GcVNhzRLS3t5TtC30C
         wPuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001170; x=1790605970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        b=bwHq1vyGJAMdqngSHxnsrYJnxY0IXWfTaeE4DSSXgld7glgJMz0opPnCMv/MftSeKR
         gq14LMpvHkPyZy3Mk5Rj/5x2GtbjjtedU/Gn9i9u8Uj3t4406v6zSByZamjh6uOLjzP6
         zQiLUoRomIAPQi2IKgWQGXMyqVe7L4ogeaT/hViOy398Y42XaeWbwEj6dIE2YU4BKm4S
         CXSF/yClv6Ay+8O3L8cpIJ893ayld6/IlI4POaEVFmrD/lgIzs6hLEgJXzvYvW4iHhEb
         TguNGjS521Y1aSZbPlT6pkFJIufk5VJYWjrZvF0WJZJwWilPw8lKHTyRAdaB1bhnvI0i
         gvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001170; x=1790605970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        b=PUB3gaPTy13fPbvzu855xn6JhyPr8Ez+LlxaV4G9IQ8JqUQqQRyQR0rZ53KUW4pYds
         UwgYvYAB4h0q6vHyyriGSPupg/RULVvNzs2HEtdQMJEeyS0nZ+MEbv2beSFaXsFBPjLq
         1KTzNLaaER2UEn4AJq6upl6oT6wJEI2C2n8M16BppysQwD0SKCJOW3J+0uaOiO6AEnWE
         eYK+ACFYBPfzdxdQLEFAWBkr9oPgXGvJ3vVnt7QKNf3gasB0JpsnHDQXMmnwTYDGCj0f
         ntPl/wP5/XMlyOZTluSlsXAk0KwoqkBw1ApOr/OHTCYpLWKDrCOX6BtQ+lcNiFFP4Z2G
         5rqA==
X-Forwarded-Encrypted: i=1; AKwUvBzrS4VA+41ah44L7l4aGr8nqAJF8gcaW5ewBKE+inCzVmtEg5HX2h95X0WUfgMFFY69liaQiS/zCj2d@vger.kernel.org
X-Gm-Message-State: AFuF++kXyvRfUBCNncu5a7AmrHqR6/Tw4ygI19TtkIpRuG5d5Iym9CPd
	s/8qu09f4CsurcXAExoOpekyns+vG2pwnYDa5B64CFpCZ0hHEC/DEtwFYMHMmF29w4ZRQzW208C
	8LI2Mcoh9CWuTmOqEsjN5YOHr8F1uF3R6SXneuzq67z/fDLoCpLJ9oTQPWlYpibH06x0y4vtmtf
	0+IPB6HPS2JN11odehxH0FRse4u15oMeSY7t5h+E91d/QT/nA=
X-Gm-Gg: AYBFou2rnI2QGUn7hPu25Abz3QFaEz3RcegFIkC2NhV/zD/YIwYTvVv6O3DUZFTWxFI
	JITjAd4dv8FF6gsslWF/6A6sfbUoWespaWsvy5U3vGSPCqnawe2fA1gdb1UZFRKlf3nXysyX4kz
	yY8Km5i4UwHcdqwspa2xDMDOPz/HUtlb+s5n0JVpgB1wqZH/1OzbL/9omIUw==
X-Received: by 2002:a05:6a21:6194:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd8c3fe021mr18964761637.8.1790001170329;
        Mon, 21 Sep 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6194:b0:3cc:f008:8123 with SMTP id
 adf61e73a8af0-3dd8c3fe021mr18964705637.8.1790001169714; Mon, 21 Sep 2026
 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:32:37 +0200
X-Gm-Features: AcwNN1WpGO3jxKAH0ED7jq5tX0NF1bkBB1T37oZy7cznqRrvJi696dq7Itctpt8
Message-ID: <CAPx+jO-3ZgVTSE2y0_TW4cy8wUYCJaogNnzgCr-WX681_H+sfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add RISC-V RPMI device power service support
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulfh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab14013 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8 a=NEAV23lmAAAA:8
 a=2HKowqdte-bNKO3h_Y0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: XK5V6AlbFVJnKEdcv64mgbwMJoHvGIRT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX9ugDg96+dFQX
 SHtahyYwczIRVCK27JOWqt1AsN5uVTFaPMoKg2hQ80QmYClCK2l3k6yyjLQdTql4zPmuRbwyQl6
 4himJ2VWpXxeitwzhBC/zZarVGZebyk=
X-Proofpoint-GUID: XK5V6AlbFVJnKEdcv64mgbwMJoHvGIRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXyeZH90xmPhjm
 dBFmPg5f8CGYUp/H2G+9+ZKjpewd6rvavSn4T4b2iqC9vD9zuIAsm2jZxScnaMr5VHUOAHhMh1J
 1DcIHSRwIklQGIBZFZWgmtTbbUuYG0JqaHfb3LrC9gmMThG7xkM+1TvoHaGTF/WTZLH/GQDRQZC
 1TeH8k+5o53nMpgk1CssZNt6/4eekn1CEY2Nls+bHo8U+L9mBE0j81yVbSwHW3QxSzzaD0IBcn9
 EO8lm/tne0hh2A8OcCexvIN3HUT6iwMluCvtdqfwrj1/OBomxGiaXP4DK/PPTuTN2VOHu0StdfH
 T0BEapYiAlE6TJwhuAFCkQFP7FlE5+zX8L40HR6mzXvbvs8bu1L9vA8kzwDpm7Z69IxdBCw2ZhY
 oqggQbGWXfFCdUH+ShpGyvfBs4PwH0iwdSowBwS+BetLtJ/qN6qcWJEkyQ7Jm/iQS4XD1cP//Os
 VtVV0NCBqOIPluHUPvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Thu, Sep 3, 2026 at 11:24=E2=80=AFAM Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
>
> The RISC-V Platform Management Interface (RPMI) specification defines a
> modular and extensible messaging protocol between the supervisor software
> and a platform microcontroller (PuC). Among the service groups it defines
> is the device power service group (service group ID 0x00009), which allow=
s
> the supervisor to enumerate the power domains of platform devices managed
> by the PuC, query their attributes, and get/set their power state.
>
> This series adds supervisor-side support for that service group:
>
>  - DT bindings for the power domain controller exposed to the supervisor
>    ("riscv,rpmi-device-power") and for the SBI MPXY channel that the SBI
>    implementation uses to expose the service group to the supervisor
>    ("riscv,rpmi-mpxy-device-power").
>
>  - A generic power domain (genpd) provider driver under
>    drivers/pmdomain/riscv/ which talks to the PuC over an SBI MPXY
>    mailbox channel. At probe it queries GET_NUM_DOMAINS, then for each
>    domain queries GET_ATTRS for the name and transition latency and
>    GET_STATE for the initial state, and registers the whole set as a
>    onecell genpd provider. Domain power on/off is driven through
>    SET_STATE with the generic ON/OFF power state parameters, so devices
>    can simply reference a domain through the "power-domains" property.
>
> The series is based on the existing RISC-V RPMI/MPXY infrastructure
> already present in the tree (drivers/mailbox/riscv-sbi-mpxy-mbox.c and
> include/linux/mailbox/riscv-rpmi-message.h), and only adds the device
> power service group definitions on top of it.
>
> Changes in v3:
>  - Move the MAINTAINERS change into its own patch, and add a new
>    "RISC-V RPMI DEVICE POWER DRIVER" section scoped to this driver and
>    its bindings instead of adding an M: entry to the existing "RISC-V
>    RPMI AND MPXY DRIVERS" section, which covers drivers maintained by
>    others.
>  - Drop the redundant trailing "bindings" from the dt-bindings subject.
>  - Compare only the value field of the RPMI power state word. The word
>    also carries a context bit, so a full word comparison would report
>    -EIO after a successful transition, and would drop a domain at probe,
>    whenever the PuC reports context as lost.
>  - Check the pm_genpd_init() return value and leave a failed domain out
>    of the onecell array. Every failure path in pm_genpd_init() returns
>    before the genpd is linked into gpd_list, so the previous code could
>    hand a half initialised genpd to of_genpd_add_provider_onecell() and
>    then list_del() an uninitialised list head in the unwind loop.
>  - Set GENPD_FLAG_DEV_NAME_FW. The domain names come from the PuC and
>    are not guaranteed to be unique or non-empty, and were used verbatim
>    as the sysfs and debugfs names, where a duplicate fails device_add()
>    with -EEXIST and takes down the whole provider.
>
> v1: https://lore.kernel.org/r/20260829205520.1691-1-joshua.yeong@starfive=
tech.com
> v2: https://lore.kernel.org/r/20260830152812.312663-1-joshua.yeong@starfi=
vetech.com
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> The series was tested under QEMU with the RPMI device power service
> implemented in firmware.
>
> Components:
>
>  - OpenSBI: latest master branch
>    https://github.com/riscv-software-src/opensbi
>
>  - QEMU: the RPMI-enabled tree at
>    https://github.com/yeongjoshua/qemu/tree/rpmi-v11.1.0
>
> Kernel config: enable CONFIG_RISCV_RPMI_DEVICE_POWER (default y on RISC-V
> when MAILBOX is enabled) along with the SBI MPXY mailbox driver.
>
> Run with:
>
>   qemu-system-riscv64 \
>       -M virt -m 2G -smp 4 \
>       -bios fw_dynamic.bin \
>       -kernel Image \
>       -M rpmi=3Dtrue \
>       -nographic \
>       -initrd rootfs-busybox.cpio \
>       -append "root=3D/dev/ram rw console=3DttyS0,115200 no_console_suspe=
nd mem=3D2048M earlycon=3Duart8250,mmio,0x10000000"
>
> The RPMI device power domains advertised by the emulated platform
> microcontroller show up as generic power domains and can be inspected
> through /sys/kernel/debug/pm_genpd/. The series was additionally booted
> with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_MUTEXES and
> CONFIG_DEBUG_ATOMIC_SLEEP enabled, with no lockdep reports.
>
> Joshua Yeong (3):
>   dt-bindings: power: Add RPMI device power service
>   pmdomain: riscv: Add RPMI device power service
>   MAINTAINERS: Add RISC-V RPMI device power driver
>
>  .../power/riscv,rpmi-device-power.yaml        |  65 +++
>  .../power/riscv,rpmi-mpxy-device-power.yaml   |  65 +++
>  MAINTAINERS                                   |   8 +
>  drivers/pmdomain/Kconfig                      |   1 +
>  drivers/pmdomain/Makefile                     |   1 +
>  drivers/pmdomain/riscv/Kconfig                |  15 +
>  drivers/pmdomain/riscv/Makefile               |   3 +
>  .../pmdomain/riscv/riscv-rpmi-device-power.c  | 485 ++++++++++++++++++
>  include/linux/mailbox/riscv-rpmi-message.h    |  11 +
>  9 files changed, 654 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-de=
vice-power.yaml
>  create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mp=
xy-device-power.yaml
>  create mode 100644 drivers/pmdomain/riscv/Kconfig
>  create mode 100644 drivers/pmdomain/riscv/Makefile
>  create mode 100644 drivers/pmdomain/riscv/riscv-rpmi-device-power.c
>
>
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> --
> 2.43.0

The v3 series applied for next, thanks!

Kind regards
Uffe
