Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C21488219
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283267; cv=none; b=f20iZMMGOg5HCflH0xvxdo7gN4pz/JG8aD66kfeX9KFWnW+OIwgvAgJyjjnQ3uuH0n8JOYbbC6LF1TYLyUVA889yZJdmGCIhVndtL3qi7+NEEtzZyN+9FjneMCuWF4yk7dbol8vKISRIubuy8hkAbzX/lcRUVSClCBkhCYr6SWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283267; c=relaxed/simple;
	bh=jgiUy5eMRpNUM8+bU8u8Yz1LZCFsAgtPKJ/eVtR6FBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueqDZMAYMhFWvvW9JBgbWzh+8bz6Quu6r/NVEC9lz+/YA/67rNBG9SPZO4o5e4E3urxw/4oTGhY2KYjZ0U7+bfxQtv1Gz4cFrTTNkkW7LCHe2wHbysHBV0Zm3DLSmWi69BqxtdS+MdoGpH7/Rp5pGaDD40+DVFjUnpfu3N6UJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CLQ/TUVZ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CLQ/TUVZ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cca401c89so1104346d6.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283264; x=1788888064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t39E3zIzKGyf4z7+xsFY+J4nC1fcBP8I9wZLt31dpDY=;
        b=CLQ/TUVZFAmHlz5Gb5F+4Sa2OX8Btehmjd3jtQI4ZHc27rxFXQpPgQFF3101IEcVEn
         S++bq4xe6sCPD/M6m1GuHPZlqILeehtPnHmyn0h43EGZu+U7mPdyi1hupr+bARY1oB5Q
         BuZF1oYZ9f6ja072qQFj1MpBZ2g0l/KwXNoGuXVaR8g0nOLRi+Qm9H4JYklELnlZVd0I
         lt52AUC37sUIZ7xeKMsXEs1wMs1n5e8zc3AR1ylPNZHOSSrF7V4SK7yJLbkCbRlSRKnL
         UM3rPyVbVuIebY8ZgZzSIVjJW7ooTqlOpwkhp06eK2Jl1arrhX3wXEONsYKdmx0PXfvH
         WN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283264; x=1788888064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t39E3zIzKGyf4z7+xsFY+J4nC1fcBP8I9wZLt31dpDY=;
        b=VvapHcj/zXkPiu2y5NsSdVWuTTO6m8RxW6LvBNL+EfjQaM4WhbhUixIFAQCAxqN7Cb
         6zpxtNL1sNWGxkvq8gDvWkss7k+38prszWe6xQShcpj6Jzz3UqKADHIIGHpyZ6q5uqqO
         EnT922lyJ6/uPak1KZDUJAjZUtkpP1au2A2Qq4F3mNMj97Q8yQwBfDxF00vbrysEQDaZ
         AmI1CBpWyq/G3uGdt4J2rMCAvn+V+JNMVkW+FU8axeZKMnXKdxdDfpmJKDLxODYOC99S
         uwaRF/Sp3+BNfZt9mO5blJEUId32ExjpN6sHc9OQR9e3/p22MVPmc0nB/oRX9hpnZ4I9
         6m0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr8bDf5dHzx9EEOpRZD87TMm7YDXol7k8dncwuUZIWIZHlbd0eHwLxOAr+WULQ6AoX94/T86niQKWSE@vger.kernel.org
X-Gm-Message-State: AFuF++knJ4LV9G5hEQ8hH+iXwcP6TKAT/fEwtJeOGKy//1VkhUG/Q859
	4Z/fawwbOZ5OpxTs1JIpCKW+3U55U2QiUyCniOlzVjCJn+CiInDhj8zqYEePauiVk8Q=
X-Gm-Gg: AR+sD13EYoWckVabXg3rXVpo85RP0Mu5G4DGNPWlgwfnnXZSWexf0+nyljcSS36yl2m
	XfBAlyW8Hr6Uw3GxVxTvpSQhIbs+r3qRxydpZiX/DkWaTE0cq6CA/IwiBwK987Wvi/qE0swyaPH
	jJlay5ZawXnWkx7yhIXHb/Zfs7HOrQZxpjcT8ZuLXlkYEfBfNTo4qeBBqhXYWLruwIvQmYMJYz9
	ke0WLxSNMZOmfrZUXzbUa3OOxFaUZdvMgNZ2AC3TAWl5v5+X3SKNfZV+yGiSTlcOxUvaYP4adH6
	X243SYGudUFc80LXDcfkZHlBO3ux1OOsH4K/QZ+N0zq8ZA8L3AN8x/MqPqrAIoMMH4fQFirLMp2
	O9RZiHyfvCHzsFiIIhtirHn9RV81/ROPYskOssah/zJhC/DEzZ9JXlP+WziKnkguGbQI3+hyxCc
	/t4q6DHEKzSEjFQxtlSyldiNsI1LZpA1yhcRHR6cjx9QMx3vu4dMFB/mAvxAgeY3bhOZjwqn4iH
	c8=
X-Received: by 2002:a05:622a:1a9d:b0:52d:70b4:2e1a with SMTP id d75a77b69052e-52fb9373ffamr417632911cf.1.1788283264448;
        Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:54 -0500
Message-ID: <20260901172058.1512508-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the code devicetree as PCI buses, which is incorrect.

There are three TC9564 SoCs on the RB3gen2 system with an industrial
mezzanine.  All implement a PCIe switch that includes an upstream
port and two downstream (external) ports, plus a third downstream
port.  The third port has an embedded PCIe endpoint with two functions,
each providing access to a 10 Gbps capable Ethernet interface.

The first TC9564 is found on the "interposer board."  Its upstream
switch port connects to the QCS6490 host PCIe root port 1, and is
described in "qcs6490-rb3gen2.dts".

The other two TC9564 SoCs are found on the industrial mezzanine board
and are described in "qcs6490-rb3gen2-industrial-mezzanine.dtso".  The
upstream switch port for one of these connects to the QCS6490 host PCIe
root port 0.  The upstream port for the other is connected to the second
downstream PCIe switch port of the TC9564 on root port 1.

   ---------------
   |   QCS6490   |
   |     Host    |
   | PCIe0 PCIe1 |                      +
   ----+-----+----  ------------------  |
       |     |      |    TC9564 1    |  |  ------------------
       |     |      |           DSP1 +---  |    TC9564 2    |
       |     -------+ USP            |     |           DSP1 +-----+
       |            |     DSP3  DSP2 +-----+ USP            |
       |            |     /  \       |     |     DSP3  DSP2 +-----+
       |            |  EPF0  EPF1    |     |     /  \       |
       |            ----+------+------     |  EPF0  EPF1    |
       |            ------------------     ----+------+------
       |            |    TC9564 3    |
       |            |           DSP1 +-----+
       -------------+ USP            |
                    |     DSP3  DSP2 +-----+
                    |     /  \       |
                    |  EPF0  EPF1    |
                    ----+------+------

The third downstream port (DSP3) on all three of these has an
embedded PCIe endpoint with two functions, each of which implements
a 10 Gbps-capable Ethernet interface.  These devicetree nodes
representing these functions were previously named "pci@" but were
renamed in the interest of consistency in commit e806c63ba51a7
("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, when these nodes are named "pcie@" (as they are now),
of_node_is_pcie() causes them to be treated as PCI bridges, which they
are not.  The previous name "pci" matched such nodes as "default-flags"
bus type, defined in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..14c64439ae1e6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -130,7 +130,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -138,7 +138,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -225,7 +225,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -233,7 +233,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

