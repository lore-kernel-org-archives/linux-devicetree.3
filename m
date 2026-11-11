Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432566;
	b=33GsK0wlnJyx6KeJ5hHOn5u7Ilzj+xJNl93fl0JOFebEdV4D/jqyakadaQUeI7JNN/VA
	 wxmbs1xCco4utxfaUGIvxVsuaAZYxR8YIMvfNm2EkO/GVmBgtmDVPHwe9GCcU8mu/VDD6
	 Ao8XDehFAUuVstKocNTw2+DogQ8MJ3GBefjjOdalC2vFR5gyXijtVoVKhIps2JkXcLJkH
	 KvxGb620/ULIzISRneAcffT1e1M0ObrM5x9+8AISc/yQlrPhxgAzAHuC/JDSliRMZyPJR
	 pP/26oUgP/mAM1na1GD/dGXsphw+A04qizNuAPFmSa+2JCR5J2800LRhdaQmBLn4e9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
	b=ZJuvr9m9AWrdk2gahGaxD8Z3ul0+PhOIaAFnjxPWHks9oE1m+G9mSULFDvhpPW3UfqV6
	 pbsVQYr+6+4CB1YiNVZ23l5oVGv2NXYJaLzk1xhzD6Y0exy/zrmAbnIjGVD2GoVV9vwCm
	 0dfqMGeVTqhes5GRitCxmQpMK5qGXi/XwZJnc+s+aWZkm0AF/QA4IACYn0BAqkxf50ISn
	 7EAB0aK45pgHM7XmGFn6KfTeFlOTnGn1ka7EFlbpjSZ19R6ot2ZgbtSscgxjyzxixyWLo
	 p1K6mVE+UrRt7on6dN0E9q5Rtiiou5EoMzqswAxit9Pxt2Li1h0H7vvY8AvgQ17ex9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTLKRFfn;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D54606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D54606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTLKRFfn
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso152253a12.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432565; x=1795037365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
        b=DTLKRFfnZ9XydDu38dZPgAw6wPK7MFh60q2ondkRQNEHwW79dfA9HkFUIRmzK3Y5Oi
         PGm+TIDXm2T6nMkuod/Zpsn9U1PNw8FKBL85KrUaX8EVrwLELcWAbre/q1Hucbt8EJg1
         YRYeVWyY2WiyNt2rNckOeXwp+t7pd+Snfm0CLYczNrA7Uu7DyzQxn3Y/EkaUbyGU3LEe
         wl8jsQ0QL6yg2J84yiAQBEHwYePRMvZbBKRO6KPBcR6SrlTRXzFfx7kO0UfTzBpWPQUE
         DGVV1JX9fPru0sahKe0OJzSofVJOhOqMrNPYPTAH3IimnCbhWTX7J600ensH0AqcjZaf
         71PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432565; x=1795037365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
        b=dSibM5qpXPtjSUkSc6dm3kecOSH58s/1PboTvf/Yn0/g4Djfc+TldmXeNFavFqkaBS
         gknk5GOknDG4LMWdUS0TNnfoDIoS+BPIQtM/VJ9WVDLDAm8tSSSggP+j3N1wdis8ozbr
         9wp8lh2APx5h6DuIYOq/y/JZCymrt1I/GZu9+vgIiL4T+GtWOKm6rRPIMVktvr77kdNg
         KALcKXf3pggdpN5iCk1PocyGbrzh3hx8yv6OQwLa5rM7HgvcnqzvWv4sl6o4PPqn3wxK
         oKKW/5tUC8F1tdCx4Vj756nhKaYM9bFsGZT5KdSa44PpWSNVRhSB4XXsVnW4g3HhPcLp
         kJ8Q==
X-Gm-Message-State: APuU4Z/na9unAVKjypw8ZmvVHHQTAAaqtNietM+w4UfhPQ11rcDlVpWV
	9XreuHEtBXMUt1+XmHLhmlz5gGNaESXNOy04zD1B8W/3B/Mrw5kUoD9naRR1/Cjw
X-Gm-Gg: AYBFou0pyFETHhDoDzpV+j/icfJ2OMsBRqRdYJRT2VQumFBGcx2AfeBohjM+ZLMTpsc
	ekDoEWhQF35oOcOEvufZ4HQBgw1X2MV0Q/bTIu5cB1K4T2R8NKANqOkD+yuqNuFhlgjwNzL5d5D
	jGBpY0mYsLCtGC0xvBTS1GjfFeAtX1SEckK3XQo7NTXNC6zVxZ1+dn17FxfPePjtcQCDtVMHmMq
	vaNyqQ034tGYie1iJNpD/kT5Ua1otk6ot/V9MN8yuqmHZA+2IcVm4XUY/x7/wPBbOw9Zwnb9FJz
	WBLKSAAyt5dCqmF1ALFCJ/jdhyWY3Qt60RrtNKtrUF0eGaPzT9lVG1D/KlIJ4SxiTa6+dAHFjhb
	ZfGEW1CQjS40hgECRgEoQWw5VZijoy1RQyZ/pHwwBOVcBfH2StmJOA8sf4WguxmasJ4Ti4AWZx5
	7zlAK9aa5dYfQJ0Cn5YbMC7N7lJ1Lq6gLpNI066OGypgFJRVCG+bzX6bLC08Z8f20a2rTe245W9
	bV5bCuIUlCQT2d93R+2w/IM3XKuKVsPGmewdNN7eWVIYZmuXaS6QhNzz+Ty3T+wHVifJkve5OQD
	kbmcSCRhFBGKCYsv28BIQrU6mu1x7cU=
X-Received: by 2002:a17:90b:54d0:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b197ccc66bmr418449a91.34.1794432564906;
        Wed, 11 Nov 2026 13:29:24 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm2310465a91.3.2026.11.11.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:29:24 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
Date: Wed, 11 Nov 2026 15:29:21 -0600
Message-ID: <20261111212921.290857-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
registry.

This prefix will be used by upcoming Devicetree bindings for
Casio calculator hardware.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..f05475072eec 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -303,6 +303,8 @@ patternProperties:
     description: Capella Microsystems, Inc
   "^cascoda,.*":
     description: Cascoda, Ltd.
+  "^casio,.*":
+    description: Casio Computer Co., Ltd.
   "^catalyst,.*":
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
-- 
2.56.0

