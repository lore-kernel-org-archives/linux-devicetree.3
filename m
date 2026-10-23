Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737620;
	b=nQuWfLx7xPx+g4eLHKUwC7niWIfLuX8n6HOZzyWZQVG4p/ugjZNm3yPqdebPx64SesG3
	 tVqqgaLZCq5pIgVHSha7BFZv2zLg+cEhL8SxsZEd3WlgzTvEwwhmm1YHu1r4U/6WGJgVT
	 iQLgaHQ8WYoD2WcGd43oK7qwRuskQc9UymhWxvg+eYcKtbzl3L+ZsQxcpfbFw5sZo6RIQ
	 NxxMewnT6OsMKQOlz3wb+W2OaDFUhwT+x0DGI9k2/smRxBa4YwSkbOXJ7CUwqywucYlZN
	 UeuBFfRIqlBqbXE2uHQddYkbWtuTnPKqrsj7UkDgU+Z6DBjxuVBE2+oLKCwvUsxOgEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=;
	b=Ffpbv1K8LJh2NzFdMpMkAPz/H6w+FIuUm7dzrQccVyN3LL6+k51yDMX2PFdu1giHFj6j
	 iY1dho7nq0saoB90jo51fMv39X4Q2rW3gnunMOfTJzSAZCdc2OkAYPpHyp3Kx3cs8UHar
	 MF2EQC3otYM17RoKzBk/CuvOINBIg0ooaIn7TW24ogldFHnLQbuUtztcoRDFNMl/P5Mva
	 0EfZ4O9/BW9EDufoSVMEAulUqXJ1oCMjSycVhTyl4+Gf/21ppFpzPWWZ0Cn5Ii3oXYYTQ
	 sCiUtAXDJUu7tvZxCYraxLUDkzsekoE08WPjxXXwiAweQhD5IRNUbte/HhAVV16I+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqmkXSH8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7660A2621
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC7660A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqmkXSH8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so396122f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737618; x=1793342418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=;
        b=SqmkXSH8V0CB7ATc9I8tjUfkkCmOXF6C/WDLEmPmui2vK93TYLJUor4xUni2xt8+h7
         9KGtee5fntj/3j97ygSJ8Cla/Tf2sOjXTnjSqT9ZKgzBk4ir8Sf+cFka2TPOd0y9JA23
         mkfbnoBd3Zg56D1HdGiUbAxpCwiRpp4Z/RNWWn/txCoCwDvJIeQjmJiCpmzGyEp4UcGX
         1gm/zvm/ERPgwugV5P0pwVB9e/i2JBkP2FCi8QXvhOVnE1W1owPe2iBPJauG1jks0/IT
         /xYvs+rQfruj2Z0BXBQiiJ3dNNH1DAdRRoD4zl/dkftaQcFmnuMagmd0QcOBLgbfrUgh
         5QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737618; x=1793342418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=;
        b=Z5D2eyfHYwyt0MYRhA664VxZ1S+jnye1WZxQWdTXAGIOcEsM5hJfP4Emr/RGmjl3sY
         s1+dhOPQ9afpitfQOApWPK39D71SSjMHrGymem0J+Wc/GrLu1tXq1hLo+MFyvQDLRN55
         pfPWJeSF2nGvqLg551kLy/YQoiy1BguxYub+N4kUff0ARyKwztsIvXp3bnR3XHcFq98f
         mPuj7VpMFF73US64OX1XjsmvSF/sCpLEuIM8JUGkK6xIJcBDQNtI5hw3wad/gu9u6NLK
         1L0+O81yjZAVY/xaitg26IsK0/ppCgAMcNUduU1njniDwybKUz31FUl7MYlL9J9K6qCJ
         wjFw==
X-Forwarded-Encrypted: i=1; AKwUvBxk7f//gvBuNhImwaITwgCxcfUCERnkqh4q8uBphv4cCsqQVIrze58dVYOXKotqYfZuapBhFdJn3vz6@vger.kernel.org
X-Gm-Message-State: AFq9FYKsQTjEYjZRx4WLlDhffpACkfB+L2P9SUALTq7kZxr87Zk+Zg8M
	f2p3/t0EBwuK+2LK7MQEYqUzcc3lUd95w2obhKohSRzqyH7I5W8VTUij
X-Gm-Gg: AYBFou3D0eD5T333eayZ3lR7xxZWEhEkqbP8BKl0WS9V8/RRzlyDfhp6Z8VEVtxWRsd
	nLnF5D+dJd6W1qv0/ksAwpiNM8UB3E4a7e81pcM0KevPurChyKgwPFrdvmkxudxnssUAHMr4S9m
	0kDPAXjOS+N4rI94G/mYFVj6Y0HvaLXKfjkROk5wkuZuTihqaRw/rLPQpFK8yhed9AkgRws797x
	IAcypkxfc5BKjQ0AlmVQfFxuJbJ4xz815yVhN62FX0JPhXq6zMG3PNH2g8EasMv8X96sczOBL4/
	jDse6rlOvST3ssoh0iWIZH+xaA9OV6lfyb8qyPdRygguRlNBtP1sgXJlfgGyi6Ez8JaG0nunqpL
	GE217PUn5Q5QfcXcbCa6SVMM3LXrH1EMFRuhIP4OCF4OQN5t+8F+Klmn7C8RLrFANkNutexpK8r
	iXVlqlOPDzGo4WggxyGDYv5Tnb7J/oeCfRwCE8JXVDx7d4/w097Qyb7sOQ21sQjA1mDcEN4tn3H
	Tb/j+sT0BPy7Mz+9FDqdDcl33ENaFPrbYN39995zV39h8rGrS093hi9K+/C+jqoKVYtd2v693mx
	0pA6IWxT4EESGOpDhhCYHq0FGADPLNB2mvRd+jvhCAJ2swCe5Vu6opjpvQmoJswzVA6kgoCZLhd
	pmKI=
X-Received: by 2002:a05:6000:258a:b0:48d:fdc0:7086 with SMTP id ffacd0b85a97d-48e3859a817mr1823119f8f.22.1792737618388;
        Thu, 22 Oct 2026 23:40:18 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:17 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:38 +0200
Subject: [PATCH v3 13/16] Documentation: accel/thames: Add initial docs
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-13-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

With pointers to the other components and how users can make use of it.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/index.rst        |  1 +
 Documentation/accel/thames/index.rst | 47 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                          |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..eb115413db07 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -11,3 +11,4 @@ Compute Accelerators
    amdxdna/index
    qaic/index
    rocket/index
+   thames/index
diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/thames/index.rst
new file mode 100644
index 000000000000..6382ff2369be
--- /dev/null
+++ b/Documentation/accel/thames/index.rst
@@ -0,0 +1,47 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+============================================================
+ accel/thames Driver for the C7x DSPs from Texas Instruments
+============================================================
+
+The accel/thames driver supports the C7x DSP cores of the Texas Instruments
+J722S as compute accelerators, for workloads such as machine learning
+inference.
+
+Each core runs a firmware that remoteproc (Documentation/staging/remoteproc.rst)
+loads;
+the driver attaches to a core remoteproc has booted, boots one left offline, and
+resets a core through it after a fault or a timeout.  The firmware's source is
+at https://gitlab.freedesktop.org/tomeu/thames-firmware/.
+
+The driver and the firmware of a core share a block of memory reserved in the
+device tree.  It holds the core's Ring, the queue of submitted Jobs in the
+order the core runs them, and its Fence, the sequence number the firmware
+writes as each Job completes.  The driver adds an entry to the Ring and rings a
+mailbox doorbell; the firmware rings one back when the Fence moves.
+
+Each file that opens the device gets a Context: a page table the core switches
+to while it runs the Context's Jobs, so the buffers of one client are isolated
+from the others'.  A buffer is created without a mapping and bound into the
+Context at a DSP address the client chooses.
+
+A Job is created once from a program, its parameters and the transfers the
+core's DMA unit performs around it, and is checked then.  It can then be
+submitted any number of times, in arrays of Jobs that run in order and signal
+sync objects when they finish; the call waits on no sync object, the fences of
+the listed buffers order the work.  The drm-gpu-scheduler spreads the
+submissions over the cores.  A Job that faults leaves a fault record, which
+userspace reads with a query; the capability query returns the sizes and
+addresses userspace compiles against.
+
+Everything else is done in userspace, as a Gallium driver (also called thames)
+that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
+
+The interface is described in ``include/uapi/drm/thames_accel.h``.
+
+.. kernel-doc:: include/uapi/drm/thames_accel.h
+   :doc: Terms
+
+Hardware currently supported:
+
+* J722S
diff --git a/MAINTAINERS b/MAINTAINERS
index c63ab2d77b01..dce817531184 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8024,6 +8024,7 @@ M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/thames/
 F:	drivers/accel/thames/
 F:	include/uapi/drm/thames_accel.h
 

-- 
2.54.0

