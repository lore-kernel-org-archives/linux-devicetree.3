Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FA3DAC13
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178918; cv=pass; b=eqD5AnAK0SCm4GD3XUQqKnyoujyNPrmSbURjukRr4Msxy1pF7y2Z+14SCV3jJkvpSSrfx+lpQqwGqRPl5tw3O40k+OZ6XfqDo747FciQiGX6Q3T6GBO8SA5SIf5EVQj0Hh5qbK3mzVqyBcLnyBqlBvccKFR9vF1WfNeNTQA+9X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178918; c=relaxed/simple;
	bh=XkF+Y0Hg5cSLuGH2FjSp9aItOrI4kjUtbkmYaZc7xOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJDo14ggXLcj2wXlzOaXaWeUgBUncVs4f5LcDLTcApLV2tsGRHIhmi6Mo+MWW0CVTc+sMDV7u9wYXr49cOLpBUEYhEkSkEYC3H0DJpeiTjl7zopXc49F0ojPpJczhOBvmdrfiO/u5n3Ux3T7EeJzz4L9z4cN7+e+KzTn+uMwygk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=KhCf+Lo1; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="KhCf+Lo1"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-439712b3416so919360fac.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779178916; cv=none;
        d=google.com; s=arc-20240605;
        b=dZqY3SQWRwLkY4Rh6pXEVS5Exkcww6YBf8RXSlgve6VgjluYxOvqHfc1LcI2RwlcC3
         uD97usP8jV5x2QzfnAkYtxHcAhKFINAU9YqF6Na12BHHTEgZ3D2vaNi+qLyGqhOU1Flw
         qpDRl7zvq3I14l0rMEkMG8bweD886+yOlTx58EJB3ceg+ixj7U29cw5Kg1YpgNWltFKJ
         WlQ9zeQwGp0lDKqnB5S8Wvu9uPb/vLjG5kjHQUsVDdW2FFFwpSFeYEzSuNOn3csqeE2R
         SV3xhwlf+fTWbcVNgmuLpHTJgmS0rm+1LrYcMLU35iol+EHIcFk9wKTRSVrxh3RnJ+QN
         qA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        fh=7eBwLC4W16cOxvYA4/tJJrfWa/l2f0zPzYmuNTKePps=;
        b=ccJgJQsEYkLiImmioEYqiPbpQMqVaOpXz0eJZdQ83KcChL7pl7aPR49YVrjhicnbQc
         C3JOhc6ryjhTJwQASjCM5KysIsrBFRqv33BOhGRQaBc8cJSnGcsI/mDo2TJ6i2PJWmWh
         xYvrZsK7hVF2AYfhmqlwe7iYADVpT/Hc0UMSjh46f5IhRAiH2IGMf8rfdRZwShP0+FcA
         kw8zuTx7WwIU6Ofym5J3iKCo9qh7JYsvDl0fW+bNLgA7LiVMmDhIzeSAOBPUvJigoWNi
         1f4JrNaiPJl545cGSZGlV4vqFPX5dmllnDWhn9e5Opf08egrELp/Nwol6Uydfa/x0WD1
         uZAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779178916; x=1779783716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        b=KhCf+Lo1Wc4sNwwtHt11F8JkPCEnQQq2H9nadkY/c+KQ91/0vUcHKqXuocopNxSnVz
         VsaEb9+5ZN61UJEyEIk/dtqHpxgyj5wtbOlT7SUZrxosKslNtOostFvHZb27LbZz6gby
         savukfX/8AKpm6GfrMRD7zGsTnPqeUJSNTHn8FP5fLhzuBfSnTFwTFqMQjHXb1jMS1tL
         HJnWF5vufeYVZp7N5ERwGfqGtVbElaUF4B6A7Ie2mCrA6dLJilWE33kzXcftC7wSducr
         tDJnDvdQwGdTY4NyuJxhr12kzxsOQmiBJQZ1/Q0KG/9uxZzw1FHlRmkZHMfmDPfzRXn5
         TjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178916; x=1779783716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbApDUE9otXvL0QjjtLdk1qVbJM8P4jzKOK5sf0GKA0=;
        b=FD7EJrDuVYrfvBJPl5bEbvEQyzHknHMMGxZjQzFWivkZ3I/Z7GO6z5GuBCZBR3vxmf
         XT/NJdTVhB2BvOPLnA7bNOwAIH7D/5mGhjkm18+L/TukAJ7/G+Gw4Dzyfag4JncqlP76
         Out0dNqOg2QEsl/ti0Is6EN1jJkqYckOYvdxjnDTq189P5zXI0z6SUhOCIKg3v0ThvbV
         v9voyjYe4+gzZD0QwbOo3GBqA/q5JQEJUR2SbfmjvTSceKYQW6D/mpCg9IV8h07/WSHI
         hgMUVmfYZ+mZaV7lar9ol5uEWivOrJ2Um9KX3QA4gZ2jVdWDQ9MCqYBLRk1XluCLTqsu
         mU9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+xCJ29lITeu4z14I6T8bFbkJsqPObkVPmRntEl0mNv/LIYAGjV+5jVHG3nOAjoUYXqxBAgxVhRfMM5@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZ1N9QwwUDsBmb/r/kVsBNQy0A9DONE2fIta+LeLQFRJSwyp7
	nV37jvYEmoi7KiBSh7C076LYfJv9gwmIhaNmVMXIKi7lGbLNKAc1A7NP5DFfwlkrpaQd1r5FhyN
	AWhWCUtDrSlhgLAM7JLtmRGqZsrOQeUtOE8OiZdODOA==
X-Gm-Gg: Acq92OFNPqncKCCE6iuoh4WDyLnAvKetxZRWGk/vuy9m3xdNJlJ6ea5JXdPjKLUmMbQ
	VCAW7tEDtFj7D7F+E5O7BELkh4oX3SLjJn5AAhnMuXlEbYiLZGJ68jFtdInzQvbxQE3h/ry2uQL
	LQyGfncXANXiWIsB5Qd1FV8bBm4kuCoCKWZmUSXQ7UncBNIhhDA0sOcaP3B9h5lv88RljrlDZrA
	9BY2sdAssQNuVwRy5OR9DY1SUGH8/HYGgE0gdDx2WkS7SfYUz9yPeJWMqdokfuLEMQtgiAOy3EX
	Zcj3+GscFgzma6D7965UybW+v7g6oTo+MiogSm2pzQJc4fyDgmEGk9sVSig6Q6DMxT6cHOKH7VT
	UluvjiMRg1Bd15Vcg/U5ZZwO9z9hju0x6tfzOkQ==
X-Received: by 2002:a05:6820:20e:b0:67c:1e60:3e90 with SMTP id
 006d021491bc7-69c94331f33mr12185683eaf.6.1779178915753; Tue, 19 May 2026
 01:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 May 2026 13:51:43 +0530
X-Gm-Features: AVHnY4JFgKnIatwx3Ei-NvI3Uzi9URU6n-MEUMadrpHdmyDax9RT0kMAxHJilm0
Message-ID: <CAAhSdy34AvYZNKDiXErv3k4OBgaJ7K-ZMQ18GEHtbqONpbh3zA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Linux RISC-V trace framework and drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Mayuresh Chitale <mchitale@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, Apr 29, 2026 at 6:21=E2=80=AFPM Anup Patel <anup.patel@oss.qualcomm=
.com> wrote:
>
> This series adds initial support for RISC-V trace framework and drivers.
> The RISC-V trace v1.0 specification is already ratified and can be found =
at:
> https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratifi=
ed
> https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified
>
> The RISC-V trace framework and drivers are designed to be agnostic to the
> underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace sh=
ould
> work fine. The discovery of trace protocl parameters are left to user-spa=
ce
> trace decoder.
>
> In ther future, there will be subsequent series adding:
> 1) Sysfs support
> 2) ACPI support
> 3) More trace drivers (such as funnel, ATB, etc)
> 4) Support for upcoming self-hosted trace specification
> 5) ... and more ...
>
> These patches can also be found in the riscv_trace_support_v3 branch at:
> https://github.com/avpatel/linux.git
>
> To test the patches, we need QEMU virt machine with RISC-V trace support
> which can be found in rv-etrace branch at:
> https://gitlab.com/danielhb/qemu.git
>
> To capture rvtrace data using perf on QEMU virt machine do the following:
> 1) Launch QEMU virt machine
>    $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
>      -kernel Image -append "root=3D/dev/vda rw console=3DttyS0 earlycon=
=3Dsbi" \
>      -drive file=3D/path/to/rootfs.img,id=3Ddisk1,if=3Dnone,format=3Draw =
\
>      -device virtio-blk-device,drive=3Ddisk1
> 2) Run perf record to capture rvtrace data
>    $ perf record --all-cpus -e rvtrace/event=3D0x1/ <command>
> 3) The step2 would create a perf.data file which has the rvtrace data.
>    Now run perf report -D and look for PERF_RECORD_AUXTRACE event
>    section(s) which point(s) to the actual rvtrace data offset.
>
> Changes since v3:
>  - Rebased on Linux-7.1-rc1
>  - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
>  - Improved PATCH7 to save the previous WP value
>
> Changes since v2:
>  - Rebased on Linux-7.0-rc1
>  - Addressed Rob's comments on DT bindings in PATCH1
>  - Addressed ref-count related issues in rvtrace_of_parse_outconns()
>    of PATCH2
>  - Made RVtrace framework more generic by avoiding implicit access
>    to component registers in PATCH2
>  - More improvements in trRamStart/Limit/WP programming and other
>    improvments in PATCH7
>  - Removed RVTRACE_BUF_LEN from PATCH9
>  - Removed redundant page_size from PATCH10
>  - Renamed found_etm in PATCH10
>  - Removed rvtrace_recording_init() declaration from header in PATCH11
>
> Changes since v1:
>  - Rebased on Linux-6.18-rc3
>  - Addressed Rob's comments in dt-bindings added by PATCH1
>  - Get reference of conn->dest_fwnode and add missing break in
>    rvtrace_of_parse_outconns() of rvtrace-platform drivers added
>    by PATCH2
>  - Added new inline function rvtrace_comp_is_empty() in PATCH2
>    and used it in rvtrace_encoder_stop() added by PATCH5
>  - Fixed trRamWPLow usage in PATCH7
>  - Determine RAM sink buffer size based on component implementation
>    ID and reduce default RAM sink buffer size to 1MB
>  - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
>    so that implementations with RAM sink address restrictions can
>    be handled.
>
> Anup Patel (6):
>   dt-bindings: Add RISC-V trace component bindings
>   rvtrace: Initial implementation of driver framework
>   rvtrace: Add functions to create/destroy a trace component path
>   rvtrace: Add function to copy into perf AUX buffer
>   riscv: Enable DMA_RESTRICTED_POOL in defconfig
>   MAINTAINERS: Add entry for RISC-V trace framework
>
> Mayuresh Chitale (6):
>   rvtrace: Add functions to start/stop tracing on a component path
>   rvtrace: Add trace encoder driver
>   rvtrace: Add trace ramsink driver
>   rvtrace: Add perf driver for tracing using perf tool
>   perf tools: Add RISC-V trace PMU record capabilities
>   perf tools: Initial support for RISC-V trace decoder
>
>  .../bindings/riscv/riscv,trace-component.yaml | 120 +++
>  MAINTAINERS                                   |  11 +
>  arch/riscv/configs/defconfig                  |   1 +
>  drivers/Makefile                              |   1 +
>  drivers/hwtracing/Kconfig                     |   2 +
>  drivers/hwtracing/rvtrace/Kconfig             |  33 +
>  drivers/hwtracing/rvtrace/Makefile            |   6 +
>  drivers/hwtracing/rvtrace/rvtrace-core.c      | 787 ++++++++++++++++++
>  drivers/hwtracing/rvtrace/rvtrace-encoder.c   | 130 +++
>  drivers/hwtracing/rvtrace/rvtrace-perf.c      | 345 ++++++++
>  drivers/hwtracing/rvtrace/rvtrace-platform.c  | 209 +++++
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c   | 338 ++++++++
>  include/linux/rvtrace.h                       | 352 ++++++++
>  tools/perf/arch/riscv/util/Build              |   1 +
>  tools/perf/arch/riscv/util/auxtrace.c         | 219 +++++
>  tools/perf/util/Build                         |   1 +
>  tools/perf/util/auxtrace.c                    |   4 +
>  tools/perf/util/auxtrace.h                    |   1 +
>  tools/perf/util/rvtrace-decoder.c             |  91 ++
>  tools/perf/util/rvtrace.h                     |  19 +
>  20 files changed, 2671 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-c=
omponent.yaml
>  create mode 100644 drivers/hwtracing/rvtrace/Kconfig
>  create mode 100644 drivers/hwtracing/rvtrace/Makefile
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
>  create mode 100644 include/linux/rvtrace.h
>  create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>  create mode 100644 tools/perf/util/rvtrace-decoder.c
>  create mode 100644 tools/perf/util/rvtrace.h
>
> --
> 2.43.0
>

Friendly ping ?

If this series looks good to you then I can send first PR for rvtrace ?

Best Regards,
Anup
