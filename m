Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829EC39CD13
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736832; cv=none; b=C4ClMOfnBqLh30KUbLWQNuviCgLlw2j1sB7dsUjjaJnXSNIMKF8wPHPTM423QKpReZRyjBQAVefWxf/BBBLGN3p3yZxNW4Q4k69a9h0a/d6svx3NdxPjRT6NSaJeZdaLU4+2zv+9YNTgyylLqQHeN1kN1dnh2DodlhfO8pQ++00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736832; c=relaxed/simple;
	bh=U1JoGZnvbz1lmyls1/v3gPQsEpMLAWDBdYn4o9KJ+Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1ybkEk/idTVbQBw4qfkZ5dB+iQ+Ey33+/48fw9u0VZUSvIWU5D/OKgBcz56SiOnDVFVKqFAdhb9Rg7XRERJqCvur8qEx+pvKAobHfbvulqxuTuaYmhufQZnZopwXT+zWwSlke+KbycVlExYimGjqJXd82YNBbsp4aKOcO3ATbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kazr7Rlq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kazr7Rlq"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1070932a12.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786736830; x=1787341630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pFsg5DaBut5RJmYZBe5aOtRtX/aP+9Aa+0P+1l5WK4=;
        b=kazr7RlqEPdiOEv0GOqS+3z03jFbFKJRHiDQjalQhLdJ5H0QKkmqOpBCRB5JEquP+w
         pAWkGoaWN4FEPftHcyUnA6kZbLM70rtO9YyXhpQ9G+7NxVc2kj7dvtI0i1FRCfgBEq9E
         uY4aX/cPooXbamX5vx2OmciH0L46mGCUllsHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786736830; x=1787341630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pFsg5DaBut5RJmYZBe5aOtRtX/aP+9Aa+0P+1l5WK4=;
        b=NwGYnhsmTI6vOx2wInyIYSPEzxz/vYjZdSbf5OKF2p/tjKhUeEc92UBDTZ26XTJDK+
         RwI8hwB6EPQwfy791zXtb2tnjj+GOeyE0Zc93Wmv7nCjxZl6y0LjM7JBqzl1S+QKE6+R
         JdFnqg8j2MhgMw5iQQdbklKtnqJ71I44rX1J7zQDvCapG7yeQ+ayUyL5tk5da3BXKWFT
         3rXWYr0T8bpWLWJJfMnibwobG/iazRwpoLvKyozS8M1dfQXhqwPCVLb3Vs1uIJfxyNsZ
         T1O6QzoxXzcL80LqcH9f0fLG/xq1q55iOZe81FdyoJcj409gpWk4zxKHDOxPlES9TMIv
         sTyA==
X-Forwarded-Encrypted: i=1; AHgh+RoJ3n1Yo4uOykgDfUgs/NDn1TGCaOBAOmFPwzOmsIbs7yO96IBgOXURiga9LBtEeg8WLO9u8baW9VDz@vger.kernel.org
X-Gm-Message-State: AOJu0YzMG1Bo/oKBagjM4n4qDoQmKV/lzUlt9F4yyfajyk6/5mPDDl/O
	gTObOUsDyklmE9dBPkk5uFxxJlvauC8ASHVgXJnjKKZbytzuByGN2yTl3QVk1+Botw==
X-Gm-Gg: AR+sD10lATLRDSsRgNa+NKAF7o9elXNB10QaeZ1PNDIJ6ZlTh/Y+nidL6Z+Aj+0k88t
	niB4lZoswXYl7EPpIkM522ia+IGFOG80WjNYurmQtNQxKXAC5bEQwjUaCChtFDnD3ZqMfCsqbG3
	RMCHoDzjG48rn65nPfDqjMxSDciHR3ej2PbhZKVjW0kgAceBdVP/dSihAq/9JNIK96iAIv1Enj9
	mIX9NBOHT8vNVKNm4nKvEP5VQ+Xrr7CiZZdq+iIve1D3LG5etkGqEgYYT2EHH5iAawRHjCEPfts
	NKrxOkVVZfEj9QOnkJVbp+oB9AB7tsICejdjfVHQypisEYfSyiV+eyRhroIbItZAnDeamh4/d0f
	lwvuqinaol2IEUBNfn/rypMQg9LYett8j/y+fK22ixlFiToCPct8iC6T6kTUC5LGexdSl3C4338
	2nqSnRzeU7jCE3HspqUl0sJCvDeRA3ScYldVtxxz12ctOGe+lYR3LMVgF+oKmjYmoYuQbdNsDOk
	B+AQAmTdocZggzxVojk/jPTl4oFVpeoAhUqX07aULdetkc=
X-Received: by 2002:a05:6a21:a4a:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3cc71af165bmr10151406637.3.1786736829719;
        Fri, 14 Aug 2026 12:47:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:dcf8:d626:8503:b94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm11446346c88.0.2026.08.14.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:47:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>,
	Suman Anna <s-anna@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
Date: Fri, 14 Aug 2026 12:46:12 -0700
Message-ID: <20260814124603.v2.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per mailing-list discussions [1] [2] [3], we want to delete the
following old file from the device-tree bindings that live in the
Linux kernel git tree:
* Documentation/devicetree/bindings/mailbox/mailbox.txt

The old .txt file did have some descriptive text about what some of
the properties meant. Those have been added to the dt-schema
repository in a pull request [4].

Also remove dangling references to `mailbox.txt` across all remaining
device-tree binding documentation files.

Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [1]
Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kernel.org [2]
Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com [3]
Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
- v1: https://lore.kernel.org/r/20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid

Changes in v2:
- Remove dangling mailbox.txt references as per Sashiko.

 .../firmware/nvidia,tegra186-bpmp.yaml        |  6 +-
 .../mailbox/allwinner,sun6i-a31-msgbox.yaml   |  3 -
 .../bindings/mailbox/altera-mailbox.txt       | 12 ++--
 .../mailbox/hisilicon,hi3660-mailbox.txt      |  2 +-
 .../mailbox/hisilicon,hi6220-mailbox.txt      |  2 +-
 .../devicetree/bindings/mailbox/mailbox.txt   | 60 -------------------
 .../bindings/mailbox/ti,omap-mailbox.yaml     |  3 +-
 .../power/reset/xlnx,zynqmp-power.yaml        |  9 +--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  2 +-
 9 files changed, 15 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index 3c44fe607e12..acdc5c1d3d8b 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -18,11 +18,9 @@ description: |
   which can create the interprocessor communication (IPC) between the
   CPU and BPMP.
 
-  This node is a mailbox consumer. See the following files for details
-  of the mailbox subsystem, and the specifiers implemented by the
-  relevant provider(s):
+  This node is a mailbox consumer. See the following file for details
+  of the mailbox specifiers implemented by the relevant provider(s):
 
-    - .../mailbox/mailbox.txt
     - .../mailbox/nvidia,tegra186-hsp.yaml
 
   This node is a clock, power domain, and reset provider. See the
diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 87d31963c1b7..f58b0d412186 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -17,9 +17,6 @@ description: |
   hold four 32-bit messages; when a FIFO is full, clients must wait before
   attempting more transmissions.
 
-  Refer to ./mailbox.txt for generic information about mailbox device-tree
-  bindings.
-
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
index c4dd93f1fed2..87749d251f09 100644
--- a/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
@@ -31,12 +31,12 @@ Example:
 
 Mailbox client
 ===============
-"mboxes" and the optional "mbox-names" (please see
-Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
-of the mboxes property should contain a phandle to the mailbox controller
-device node and second argument is the channel index. It must be 0 (hardware
-support only one channel).The equivalent "mbox-names" property value can be
-used to give a name to the communication channel to be used by the client user.
+The common mailbox binding properties "mboxes" and the optional "mbox-names"
+can be used. Each value of the mboxes property should contain a phandle to
+the mailbox controller device node and second argument is the channel index.
+It must be 0 (hardware support only one channel). The equivalent "mbox-names"
+property value can be used to give a name to the communication channel to be
+used by the client user.
 
 Example:
 	mclient0: mclient0@400 {
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
index 3e5b4537407d..ec2da5c9e647 100644
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
@@ -35,7 +35,7 @@ Client
 
 Required properties:
 - compatible		: See the client docs
-- mboxes		: Standard property to specify a Mailbox (See ./mailbox.txt)
+- mboxes		: Standard property to specify a Mailbox
 			  Cells must match 'mbox-cells' (See Controller docs above)
 
 Optional properties
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
index 044b17f3a77a..de9fbf722bee 100644
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
@@ -55,7 +55,7 @@ Mailbox client
 Required properties:
 --------------------
 - compatible:		Many (See the client docs).
-- mboxes:		Standard property to specify a Mailbox (See ./mailbox.txt)
+- mboxes:		Standard property to specify a Mailbox
 			Cells must match 'mbox-cells' (See Mailbox Device Node above).
 
 Optional Properties:
diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
deleted file mode 100644
index af8ecee2ac68..000000000000
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Generic Mailbox Controller and client driver bindings
-
-Generic binding to provide a way for Mailbox controller drivers to
-assign appropriate mailbox channel to client drivers.
-
-* Mailbox Controller
-
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
-
-Example:
-	mailbox: mailbox {
-		...
-		#mbox-cells = <1>;
-	};
-
-
-* Mailbox Client
-
-Required property:
-- mboxes: List of phandle and mailbox channel specifiers.
-
-Optional property:
-- mbox-names: List of identifier strings for each mailbox channel.
-- shmem : List of phandle pointing to the shared memory(SHM) area between the
-	  users of these mailboxes for IPC, one for each mailbox. This shared
-	  memory can be part of any memory reserved for the purpose of this
-	  communication between the mailbox client and the remote.
-
-
-Example:
-	pwr_cntrl: power {
-		...
-		mbox-names = "pwr-ctrl", "rpc";
-		mboxes = <&mailbox 0 &mailbox 1>;
-	};
-
-Example with shared memory(shmem):
-
-	sram: sram@50000000 {
-		compatible = "mmio-sram";
-		reg = <0x50000000 0x10000>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x50000000 0x10000>;
-
-		cl_shmem: shmem@0 {
-			compatible = "client-shmem";
-			reg = <0x0 0x200>;
-		};
-	};
-
-	client@2e000000 {
-		...
-		mboxes = <&mailbox 0>;
-		shmem = <&cl_shmem>;
-		..
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index 8504ceb64806..7e3b7b68841c 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -53,8 +53,7 @@ description: |
   ==============
   A device needing to communicate with a target processor device should specify
   them using the common mailbox binding properties, "mboxes" and the optional
-  "mbox-names" (please see Documentation/devicetree/bindings/mailbox/mailbox.txt
-  for details). Each value of the mboxes property should contain a phandle to
+  "mbox-names". Each value of the mboxes property should contain a phandle to
   the mailbox controller device node and an args specifier that will be the
   phandle to the intended sub-mailbox child node to be used for communication.
   The equivalent "mbox-names" property value can be used to give a name to the
diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
index 079ad977b907..60f0882f5381 100644
--- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
+++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
@@ -27,12 +27,9 @@ properties:
       mailbox controller device node and an args specifier
       that will be the phandle to the intended sub-mailbox
       child node to be used for communication. See
-      Documentation/devicetree/bindings/mailbox/mailbox.txt
-      for more details about the generic mailbox controller
-      and client driver bindings. Also see
-      Documentation/devicetree/bindings/mailbox/ \
-      xlnx,zynqmp-ipi-mailbox.txt for typical controller that
-      is used to communicate with this System controllers.
+      Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+      for typical controller that is used to communicate with
+      this System controllers.
     items:
       - description: tx channel
       - description: rx channel
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..e238f100f8ff 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -69,7 +69,7 @@ properties:
     maxItems: 1
     description:
       Reference to the mailbox representing the outgoing doorbell in APCS for
-      this client, as described in mailbox/mailbox.txt
+      this client.
 
   "#clock-cells":
     const: 0
-- 
2.55.0.691.gc56d675ccc-goog

