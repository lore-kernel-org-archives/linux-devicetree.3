Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF0318B9C
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478123; cv=none; b=GppLkoiocMiNGW0x5bEXSBE7zLB/ooHNOgQj4jnr0gwdNqTgIqrePOsTX/TeX/MDvwa40bh9KVdGjL/p7FXJZYHCIcmAItsTCsfrJnyFww2Xvyk462MpI452fnAT5azctZb/hCFjt5wVQqOJOTCzgz3XaM1anXn0AXIsift4EtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478123; c=relaxed/simple;
	bh=lGHgI1JIe+sWn6wQseGpmPyz4c4cXG9smc3s5v94fd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVxsmS2LfJM1n2X8+HaumF8aHnDyQdWOZdYDXEJieTv0YKY2ovhtASTlQmvGz45at4bMaUFb/+bPlZf9Q8kGHSHNOsbqGCJPoZULMS+usgGhGdjgoSURCAC7HgtlP347Z4XzjwNTV4zXZ6+PxI1GWXTdoKCeFT25JmaKyHmkJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0oXtrIZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0oXtrIZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so9335545e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478120; x=1776082920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Ib7KIoqjZFUSzNWhbYzkMnF3PEw+9LcP+ImCBKEuM=;
        b=n0oXtrIZNbFGiXjB7HMM1iqZjGH5KknhC2DdELAdowTGFjuVIeDwjWYYN6jhD+MG/e
         cDKQ4S0VHoBKVJDuxxSwB1OQ4GYBkaipWN3LE/7UJl81lyA8s5L0YerkSLqVPkTTqffz
         byu0Rz1dWaP2w4D19HR1EZbiW/Zc9dR3n0OHHZLJYJx/bhIwJBbkdguX+ybX6oYdQtuF
         0CZVdw1P4+Tw9aP9yt3O1Y8GaYOGFMabS9yNnEzRDhLxKufZVK34pZKHwdyvrEDxC7bS
         SOr4Qtbek+zDqypdbjdLjgT96pnqsyvd2kfcFjZ6XRsiCLL+Klj8kcS/I+Jcyk3HAdP5
         8Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478120; x=1776082920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Ib7KIoqjZFUSzNWhbYzkMnF3PEw+9LcP+ImCBKEuM=;
        b=Bf7gc2jVlChBp9GLYLPXmxnMmHay5o5xyUbZqRSedEAZCUTMeRtqHXwv3E6ov2ODaN
         C0CLr5Jvefaz6OJcWEgAQi0keweGKNy0X+kWXkxCQjKaTg3CmbfOr9yvSbydkRGLlj2q
         aJwEfsAF7Yh62QKPSTQNYmoMBIGiMNGUd5TTBZ8NhY8r6EPJC+x+LRvuB0EgxugoR2TQ
         a0A2A2vu8HHtTd82kSKiBGr80Zg2EFc8SiriLv0JjwIOd/iWmY+IXlm6HN/aJWI+8NPj
         kkpF2wvl8QPqRbnS9GPYcUnaoMB5XSLJCjVW9e+AUbleS/B6FWH+GB4eD4InmfACkVjG
         Qq5w==
X-Gm-Message-State: AOJu0YzUkxcXr3BUsbAESQNmr9pfR9XJn+0l4591t1T95rYj0rR/pAD4
	EafY+uz5j3ihuDWaKIHtp1/aYlsZjTIc2ktrCoZ+GkEtEtbQZ6QgooiT
X-Gm-Gg: AeBDieusjs1KEQUvHLcXUcGK23uGx+bkuNkHnpujkugxtAL47v2hvdo0yP6qEVHkqT3
	qgIPmuRSPw6CsXcfgAf6ohbfk01CT9TNWFx1m14XBdhfnZ9kZMIVm3Pm8uY7VQNZFi57n5Pjf6Y
	a2rPMVMe5b2wrN/E4DzxJAe2QMrP9HtBBaRsjbnOYjgDLtrvb2gqq+2+mkXeT7dydp+mMA7SjUN
	Aq3Rxg4VxiX48NVVWuViyVu7MMqHDWOhVy5ezGUQTPLYbsKyu5nvNXW+AazJCPTJoRrGupLZ2Tt
	wuOCjtjP6GFrQs8ajyWvCAfoAm62cQMORtRPkHV2gpo9hUVkw91owfQvgsCIkbk2R/aP3H3M3vC
	Xb9jqZcqB4UhJddDb01Ibs4ywYZNdWfioDvpWMj0qpIaKtf/NjBALZNLKRW6RaMjLMIEgkLGAsC
	YUjiA//xf8/RZwMlm4cyzxD0MNwZTOzqPyR2Zv71j3hnQVNieCbA==
X-Received: by 2002:a05:600c:358b:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-488995cb858mr221859825e9.0.1775478119735;
        Mon, 06 Apr 2026 05:21:59 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1c148sm138541595e9.5.2026.04.06.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:21:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/3] dt-bindings: dsp: fsl,dsp: small cleanup
Date: Mon,  6 Apr 2026 05:20:22 -0700
Message-ID: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hello everyone,

So, with this patch series, we attempt to tidy up the fsl,dsp binding a
bit. Most importantly (and the reason why this was sent as an RFC), I'd
like to remove the compatibles corresponding to the SOF programming model
(i.e. the compatibles ending in "-dsp") from the binding. The reasons are
explained in the commit message, but basically the problem we're dealing
with is that we have a binding file in which two relatively different
programming models have been crammed together.

Since at the moment there's no plan to upstream the devicetrees making use
of the SOF programming model, we are stuck having to also take the SOF
programming model into consideration when making changes to the binding
(even if said changes only target the RPROC programming model).

Now, since there's no devicetree users in the upstream kernel for the SOF
programming model, I'd like to permanently remove it from the fsl,dsp
binding. If the SOF devicetrees are ever upstreamed then I think the
bindings should follow the model of fsl,imx95-cm7.yaml (i.e. one binding
per chip or group of chips, including the common fsl,sof-cpu)

As for the other projects, u-boot seems to have a devicetree node using
the "fsl,imx8mp-dsp" compatible (node has status "disabled", though)
defined at "arch/arm/dts/imx8mp.dtsi". The node configuration seems to
follow that which was used in the upstream kernel and modified via
commit f048f2126fcc ("arm64: dts: imx8mp: Configure dsp node for rproc
usage") to use the RPROC programming model.

If need be, I can send a patch to u-boot in which we configure the DT
node for RPROC like we did in Linux.

Let me know if this series would be acceptable given the current
situation.

Thanks!

Laurentiu Mihalcea (3):
  dt-bindings: dsp: fsl,dsp: drop references to SOF programming model
  dt-bindings: dsp: fsl,dsp: remove reserved memory definitions
  dt-bindings: dsp: fsl,dsp: remove descriptions for common properties

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 94 +------------------
 .../bindings/mailbox/arm,mhuv2.yaml           |  8 +-
 2 files changed, 9 insertions(+), 93 deletions(-)

-- 
2.43.0

