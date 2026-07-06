Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4723161A3;
	Mon,  6 Jul 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345534; cv=none; b=kxlz+j3GRRo46nhnXnNbM5ymQlKoPt5nQp6bnOTFR92ohg/jLvQDhT0TGR+P1t08h9y6RWCBQsPDD6WlwRfp9cEDVHpmPpV0dtdziWfPxIMEEP1Wvnme+H1/RE508YnbXN4g2oqaLTg0/e2hXV26ldz/gax666dA27t3snrboAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345534; c=relaxed/simple;
	bh=vWg4gUtNkdbROhbG26cNwC/fCXQrOb4eQBXyHe9MzyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HByoCVlDTjdQgUMg7clT6q2m/fy+a0YbfZ/8W2Q6BwD8pMxSGJEe4Zwt01oFZkS6JfWrcDnCNZK5gv0Jv2otdeelCYzZ7GrP9H74D4JYHuwo6pYdNiPR6gIu9yDNBCx6D842pFs9AKbToYEYivTV7Ek4N2M8v24RvzIxghNC4r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hLJkwtHz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hLJkwtHz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AFB232C5;
	Mon,  6 Jul 2026 06:45:25 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E95F33F7B4;
	Mon,  6 Jul 2026 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345529; bh=vWg4gUtNkdbROhbG26cNwC/fCXQrOb4eQBXyHe9MzyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLJkwtHzX3LE2sw0nr9bdd13FPDF/8F4iEw7n4O8M9NEqB/yjLIowGEL6/pS3usYx
	 OColnNZfgckwy1c20qHjcVwIHyJey3Tqk0lkTdN/awcXhlqLugkvZewpE/mMKfKWsN
	 Cy8IeAhZdK9genE2QEj9fxNz/5FqJD2iOWVUlEKE=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Date: Mon,  6 Jul 2026 15:44:48 +0200
Message-ID: <20260706134455.132091-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attribute files as exported by the LFA driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa

diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
new file mode 100644
index 000000000000..afd349af9cf1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-lfa
@@ -0,0 +1,106 @@
+What:		/sys/firmware/lfa
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		The Arm Live Firmware Activation (LFA) spec describes an
+		interface between platform firmware (an agent) and any user
+		on the non-secure side (like the Linux kernel) to activate
+		pending firmware updates at runtime. The actual firmware
+		update would be provided independently (out-of-band, or
+		via any existing explicit firmware update mechanisms), then,
+		if supported, can be activated immediately, without rebooting
+		the system.
+		This directory contains one directory for each of the LFA
+		capable firmware images supported by the agent, identified by
+		its GUID. Within each directory, the same set of sysfs files
+		provides access to the properties and actions for this
+		particular firmware image.
+
+What:		/sys/firmware/lfa/<GUID>/activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to trigger the
+		activation of that firmware component. An update must be
+		pending for this to be successful.
+
+What:		/sys/firmware/lfa/<GUID>/activation_capable
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware image is
+		capable of being activated.
+
+What:		/sys/firmware/lfa/<GUID>/auto_activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to allow a firmware image
+		to be automatically activated once a new firmware update
+		becomes available ("pending"). This depends on a working
+		notification scheme, for instance via an ACPI notification
+		or an interrupt to notify the kernel.
+
+What:		/sys/firmware/lfa/<GUID>/cancel
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to cancel a recently
+		triggered activation, if that has not finished yet.
+
+What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this image requires
+		a CPU rendezvous in firmware to be activated. If true, this
+		means all CPUs will enter the firmware during the activation
+		process, so will not be able to execute kernel code or
+		handle interrupts for a brief moment.
+
+What:		/sys/firmware/lfa/<GUID>/current_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the currently running version of that firmware
+		image, as reported by the agent (if supported).
+
+What:		/sys/firmware/lfa/<GUID>/force_cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to force whether the kernel
+		will perform a CPU rendezvous during activation. This has no
+		effect if the firmware already *requires* a CPU rendezvous.
+		Firmware images might provide services to the kernel, at which
+		point is might be unsafe to continue running the kernel while
+		the activation is performed. Sending all CPUs into firmware
+		provides the safest option for the kernel. If you know for
+		certain that there are no services provides by that component
+		or the firmware component can handle requests during the
+		activation, you can write a 0 in here to avoid the brief
+		kernel downtime.
+
+What:		/sys/firmware/lfa/<GUID>/may_reset_cpu
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware image
+		requires a CPU reset during the activation.
+		Currently this type of firmware image is not supported by
+		the kernel driver, as we cannot handle a CPU reset yet.
+
+What:		/sys/firmware/lfa/<GUID>/name
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows a human readable name for that firmware image, if
+		known. Depends on the kernel driver knowing this particular
+		GUID, via a built-in list.
+
+What:		/sys/firmware/lfa/<GUID>/pending_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the version number of a pending firmware update
+		image, as reported by the agent (if supported).
-- 
2.43.0

