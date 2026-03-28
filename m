Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68218AE3
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685197; cv=none; b=U4C0ehA5rx62Wahk5MfRv8bKWQDUaXbisj0/Lk5yRxE4yPSxrLq81puX5rkWaem1yTFsZgAGNaunEaj57giBEzbjTAYuxuCLh+8khoUUVj9ASCAw3RRqYUJJfIzECc7DtSsBgZBSVJdpkaDjoXJEuW/b7U/QtMYALOEWeFafBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685197; c=relaxed/simple;
	bh=HMIlO2HB8kteQGHve0VJ7952y7VrtffPyKp1ehZguUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oxaXylUfnfmubPpIqnU7Sk9z14qa/SbC1ZW7T7g06m86vyIA+7zN5o6aMzDI+AEsR5es1rLs+lefHh/XPNNpJJ6SxKBQigwGi3EXxaUjTnyO1sxtiydTYJY8aL603Uqrm+xgRXGrrf4WhUqj3oa/oDFp1uBd5iKv1/cDLtvyOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWnVfDcp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWnVfDcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774685195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uEhgvImiI2SdemhW4ShQtWdhDdGGFx3Ew+gfxRGc0Ak=;
	b=eWnVfDcpG8h/HAKg9Roz+eUW9gBUBzw9HewuAZ39DwC6jOqZSVhnt9Evie8v5Tsai60IhH
	Srw2zRKjL/sH4yOUGLr15OHq11i7q9XNLs9QbrtDoQW9QpnL7AtskIE7Ti9CC/03+feMSS
	tzjUErTRz0abUFAeawYl0NE4ZSI/fv0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-G5Cs1eWQOueGVrcJ-r7V1A-1; Sat,
 28 Mar 2026 04:06:32 -0400
X-MC-Unique: G5Cs1eWQOueGVrcJ-r7V1A-1
X-Mimecast-MFC-AGG-ID: G5Cs1eWQOueGVrcJ-r7V1A_1774685190
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A1221800365;
	Sat, 28 Mar 2026 08:06:30 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.44.32.48])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBFBE1800351;
	Sat, 28 Mar 2026 08:06:25 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Simon Horman <horms@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Pasi Vaananen <pvaanane@redhat.com>
Subject: [PATCH net-next v2 0/5] dpll: zl3073x: add ref-sync pair support
Date: Sat, 28 Mar 2026 09:06:19 +0100
Message-ID: <20260328080624.593916-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This series adds Reference-Sync pair support to the ZL3073x DPLL driver.
A Ref-Sync pair consists of a clock reference and a low-frequency sync
signal (e.g. 1 PPS) where the DPLL locks to the clock reference but
phase-aligns to the sync reference.

Patches 1-3 are preparatory cleanups and helper additions:
- Clean up esync get/set callbacks with early returns and use the
  zl3073x_out_is_ndiv() helper
- Convert open-coded clear-and-set bitfield patterns to FIELD_MODIFY()
- Add ref sync control and output clock type accessor helpers

Patch 4 adds the 'ref-sync-sources' phandle-array property to the
dpll-pin device tree binding schema and updates the ZL3073x binding
examples.

Patch 5 implements the driver support:
- ref_sync_get/set callbacks with frequency validation
- Automatic sync source exclusion from reference selection
- Device tree based ref-sync pair registration

Tested and verified on Microchip EDS2 (pcb8385) development board.

Changes:
v2 - added proper reviewed-by tags (requested by Kuba)

Ivan Vecera (5):
  dpll: zl3073x: clean up esync get/set and use zl3073x_out_is_ndiv()
  dpll: zl3073x: use FIELD_MODIFY() for clear-and-set patterns
  dpll: zl3073x: add ref sync and output clock type helpers
  dt-bindings: dpll: add ref-sync-sources property
  dpll: zl3073x: add ref-sync pair support

 .../devicetree/bindings/dpll/dpll-pin.yaml    |  11 +
 .../bindings/dpll/microchip,zl30731.yaml      |  30 +-
 drivers/dpll/zl3073x/chan.h                   |  17 +-
 drivers/dpll/zl3073x/core.c                   |   3 +-
 drivers/dpll/zl3073x/dpll.c                   | 295 ++++++++++++++----
 drivers/dpll/zl3073x/flash.c                  |   3 +-
 drivers/dpll/zl3073x/out.h                    |  22 ++
 drivers/dpll/zl3073x/ref.h                    |  46 +++
 drivers/dpll/zl3073x/regs.h                   |   2 +
 9 files changed, 348 insertions(+), 81 deletions(-)

-- 
2.52.0

