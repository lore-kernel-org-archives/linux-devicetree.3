Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD7317160;
	Thu, 21 May 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352346; cv=none; b=sSBZJCv/KARkpTbXguId3RwkpFPgJsQlzgaSIG2GVXgGULHfdUdtK1nakjAx2/qAhW2/cwsWHazlGfjQZHOv1x321o/GnRyTBDo30boreLIzcxUzs+xk7GfU0+reEcrCbySV99IZj7SehBhucXahINCXtudeBZokv2m4q/X2HSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352346; c=relaxed/simple;
	bh=j3LbjcW5iv3a5oBbtOF7GY85Ks07ZmgY9ZEPdwE0yQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQ7kyfahXfGoh5hi4WsHk0MobVFMYPD26fdyRSQkWqtoWOX8eCgTZTg35NL7WNUorHxlYdv9tsTFnLoZykRAM7Ii9Ua9ruKKilMY10SUXJN0IYSiqm0f30dBtnYUQb5IGjoDG/hdq2teh56fxfFtyvVoxUBgVMcAfgDIcqa2OnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YbXmNkVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YbXmNkVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9877C1F000E9;
	Thu, 21 May 2026 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352345;
	bh=OZ+wbHuLYtAFoKv2IHAt5WR5yXuo+mGEE/c/lTHPVU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YbXmNkVUqvYU33zGm7TJFw+n4pRu0xxLnQ2+IMesL4mfKvmpj2p3SuAw86VURaejW
	 Dgm/yuLoMHyEudn14b9sGNvd+azC7a9dTxxfgE9Nb/3eKsK8mj1fLeuGMFcmhmfVBk
	 d6Ew5cv/gM7LTCatyRIkL9jM4NKtoMvifccpgqEU=
Date: Thu, 21 May 2026 10:32:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anup Patel <anup@brainfault.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/12] Linux RISC-V trace framework and drivers
Message-ID: <2026052158-barrack-gosling-3aff@gregkh>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <CAAhSdy34AvYZNKDiXErv3k4OBgaJ7K-ZMQ18GEHtbqONpbh3zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy34AvYZNKDiXErv3k4OBgaJ7K-ZMQ18GEHtbqONpbh3zA@mail.gmail.com>

On Tue, May 19, 2026 at 01:51:43PM +0530, Anup Patel wrote:
> Hi Greg,
> 
> On Wed, Apr 29, 2026 at 6:21 PM Anup Patel <anup.patel@oss.qualcomm.com> wrote:
> >
> > This series adds initial support for RISC-V trace framework and drivers.
> > The RISC-V trace v1.0 specification is already ratified and can be found at:
> > https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
> > https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified
> >
> > The RISC-V trace framework and drivers are designed to be agnostic to the
> > underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
> > work fine. The discovery of trace protocl parameters are left to user-space
> > trace decoder.
> >
> > In ther future, there will be subsequent series adding:
> > 1) Sysfs support
> > 2) ACPI support
> > 3) More trace drivers (such as funnel, ATB, etc)
> > 4) Support for upcoming self-hosted trace specification
> > 5) ... and more ...
> >
> > These patches can also be found in the riscv_trace_support_v3 branch at:
> > https://github.com/avpatel/linux.git
> >
> > To test the patches, we need QEMU virt machine with RISC-V trace support
> > which can be found in rv-etrace branch at:
> > https://gitlab.com/danielhb/qemu.git
> >
> > To capture rvtrace data using perf on QEMU virt machine do the following:
> > 1) Launch QEMU virt machine
> >    $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
> >      -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> >      -drive file=/path/to/rootfs.img,id=disk1,if=none,format=raw \
> >      -device virtio-blk-device,drive=disk1
> > 2) Run perf record to capture rvtrace data
> >    $ perf record --all-cpus -e rvtrace/event=0x1/ <command>
> > 3) The step2 would create a perf.data file which has the rvtrace data.
> >    Now run perf report -D and look for PERF_RECORD_AUXTRACE event
> >    section(s) which point(s) to the actual rvtrace data offset.
> >
> > Changes since v3:
> >  - Rebased on Linux-7.1-rc1
> >  - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
> >  - Improved PATCH7 to save the previous WP value
> >
> > Changes since v2:
> >  - Rebased on Linux-7.0-rc1
> >  - Addressed Rob's comments on DT bindings in PATCH1
> >  - Addressed ref-count related issues in rvtrace_of_parse_outconns()
> >    of PATCH2
> >  - Made RVtrace framework more generic by avoiding implicit access
> >    to component registers in PATCH2
> >  - More improvements in trRamStart/Limit/WP programming and other
> >    improvments in PATCH7
> >  - Removed RVTRACE_BUF_LEN from PATCH9
> >  - Removed redundant page_size from PATCH10
> >  - Renamed found_etm in PATCH10
> >  - Removed rvtrace_recording_init() declaration from header in PATCH11
> >
> > Changes since v1:
> >  - Rebased on Linux-6.18-rc3
> >  - Addressed Rob's comments in dt-bindings added by PATCH1
> >  - Get reference of conn->dest_fwnode and add missing break in
> >    rvtrace_of_parse_outconns() of rvtrace-platform drivers added
> >    by PATCH2
> >  - Added new inline function rvtrace_comp_is_empty() in PATCH2
> >    and used it in rvtrace_encoder_stop() added by PATCH5
> >  - Fixed trRamWPLow usage in PATCH7
> >  - Determine RAM sink buffer size based on component implementation
> >    ID and reduce default RAM sink buffer size to 1MB
> >  - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
> >    so that implementations with RAM sink address restrictions can
> >    be handled.
> >
> > Anup Patel (6):
> >   dt-bindings: Add RISC-V trace component bindings
> >   rvtrace: Initial implementation of driver framework
> >   rvtrace: Add functions to create/destroy a trace component path
> >   rvtrace: Add function to copy into perf AUX buffer
> >   riscv: Enable DMA_RESTRICTED_POOL in defconfig
> >   MAINTAINERS: Add entry for RISC-V trace framework
> >
> > Mayuresh Chitale (6):
> >   rvtrace: Add functions to start/stop tracing on a component path
> >   rvtrace: Add trace encoder driver
> >   rvtrace: Add trace ramsink driver
> >   rvtrace: Add perf driver for tracing using perf tool
> >   perf tools: Add RISC-V trace PMU record capabilities
> >   perf tools: Initial support for RISC-V trace decoder
> >
> >  .../bindings/riscv/riscv,trace-component.yaml | 120 +++
> >  MAINTAINERS                                   |  11 +
> >  arch/riscv/configs/defconfig                  |   1 +
> >  drivers/Makefile                              |   1 +
> >  drivers/hwtracing/Kconfig                     |   2 +
> >  drivers/hwtracing/rvtrace/Kconfig             |  33 +
> >  drivers/hwtracing/rvtrace/Makefile            |   6 +
> >  drivers/hwtracing/rvtrace/rvtrace-core.c      | 787 ++++++++++++++++++
> >  drivers/hwtracing/rvtrace/rvtrace-encoder.c   | 130 +++
> >  drivers/hwtracing/rvtrace/rvtrace-perf.c      | 345 ++++++++
> >  drivers/hwtracing/rvtrace/rvtrace-platform.c  | 209 +++++
> >  drivers/hwtracing/rvtrace/rvtrace-ramsink.c   | 338 ++++++++
> >  include/linux/rvtrace.h                       | 352 ++++++++
> >  tools/perf/arch/riscv/util/Build              |   1 +
> >  tools/perf/arch/riscv/util/auxtrace.c         | 219 +++++
> >  tools/perf/util/Build                         |   1 +
> >  tools/perf/util/auxtrace.c                    |   4 +
> >  tools/perf/util/auxtrace.h                    |   1 +
> >  tools/perf/util/rvtrace-decoder.c             |  91 ++
> >  tools/perf/util/rvtrace.h                     |  19 +
> >  20 files changed, 2671 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> >  create mode 100644 drivers/hwtracing/rvtrace/Kconfig
> >  create mode 100644 drivers/hwtracing/rvtrace/Makefile
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> >  create mode 100644 include/linux/rvtrace.h
> >  create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
> >  create mode 100644 tools/perf/util/rvtrace-decoder.c
> >  create mode 100644 tools/perf/util/rvtrace.h
> >
> > --
> > 2.43.0
> >
> 
> Friendly ping ?
> 
> If this series looks good to you then I can send first PR for rvtrace ?

They should be as patches, not a pull request, after you get everyone to
agree that the user api is ok.

thanks,

greg k-h
