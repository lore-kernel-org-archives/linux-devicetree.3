Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1E49DBB8
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050228; cv=none; b=c5M3i2V1uiMfHkHXdw0XFTWQM4eoObpuN13gNgdsY4hCGG7jSy5jEpuSO965+ZqyDwKzBQg9j/0C649TZllx6WQeCbpjPepUo7I/dpVgomXjJ0Agd1Hcn58mcXJeDrdvuiXaunu17s8oU5Ln87UL0Xbdj/U9u4tEos1/b0N0faY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050228; c=relaxed/simple;
	bh=oAVOptHgaHYJzEuPIUaZrEgs391cInOfG4C/drncIwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqlfBM1h/S1lZ81myTtuBS1KoozpqmOPsAhxmH80VApQUfJ0pgUNOIoiCxqfkpfyawfnPXdVCSDGIQVHyK5vJhHcKbFrRrWbyUV6j2pM7kWJBmqNMU1YTutesc2dypjkBOSdvhdQA1Fa6jRt6ohkNgW3gOJx4jIEX32vCc0YQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKtpTJik; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKtpTJik"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5338f65913dso7121251cf.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050224; x=1791655024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=mKtpTJiktUBc0mx5QzWhphZ+vVetoYebj7DoWo/I6rEEY522kwGxP7mSjmII+flx5F
         WyYSNF+Y5VNYU7YNVSjUsraNGEP06vP87xQreacrEUcJaD/+P6y2oC6TrF41d0q7ug5b
         iJW+CM13321Sehhc1N0oYthJG5TygZ2yyIxSQMLNFdcAriLHhwTeUX58ubxb+bR5gqPK
         wvUc3HFGHJo5/hT9lgbCSq9+mCb2kZFh41Th35Xx3olq3uNjp7KIgE8HrHbaSgwedct/
         Zu7YJisSuD4A3UlM66fz04ruAYzDmXKVwL6oGHCtjucjS1dKtTztvuQ2CgHLvkz+V8KB
         wnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050224; x=1791655024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=OexhDcilBxG9GqADVS5lcgD0EYpbP2l7RhPqMm6XdcOYhLO700mTe8fwPzs7ef/+DB
         XhvEAZ7bZatZotEwMpDoV15EnDuqQ+8VujK28wbL7rBZoVSWLDsEnHQRSbZmmiqY1d3L
         9VS3yFd/YdruJhpHexZrUrVBD00AGkIafFjoV+sowM7HWhge+KbEa8xuSV9QpU9D3jOv
         drXSR13oPCdM+QD1WC3S8cT3+VnsW7MMAHLtwL0ZlUgFZ5G0YPovT37DppzZUmg7o3o6
         9rWW9hYh+b18hwEx3zo3T/sZOXeoatYpnbfUMbYbW46Lix74gg/rUK29Y+iz+/UIc0de
         LkCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN3MMoGprTVStgPwMMnUOaMkALWhTnSBx/OmRP1d8zDEVe9q0MJivMsj4Ifencwdb/VWvW43jFgrGM@vger.kernel.org
X-Gm-Message-State: AFuF++nJhREhjhqOdp/O3/3aBV+Xt86Yqp4M7DBmkJ1O89UeVUz8yLZP
	rMpeUnwYcoRJa5DhC+Y7AhL7LH8bB7h0WAcFSVSvhZmy/c1TdYezikQy
X-Gm-Gg: AYBFou27c1l0crSJZHnA8d6Hn8AL+Hi5tSATA9Z855JznggD4VgHcKxF/eVrXJq1FM5
	bUSk0MElK5hQI+TqhQrrSEHUap7pXE8bGjiXQBlcbio1J2d5lAeAffZoYKuH/A5mSccXShRw3Jw
	w11ZGYuByVAPEPXnxYIiC81FPQrJ0Izrli72x6jVi4hk20fZR2p3n8EZ1nIutZBVDMGgsN3KIm+
	xZ+YMvFQwsYRg3xXJCZapsjEr9JQDmQJT0sANsI+WR0+9p58BecbHUus9eXxKERFrax5apGdj9V
	3IFn6ZvGRoh0jeFLDMUyVr2lA24nw2q2MjgMPNo1EcCHzpyvJOK8hC4n+0PGDjzFFXt83vrx+fl
	6hLCP6kBSq24uieWRJLbKQR3AOk4zd/ePdEJnpsBa287soZNBl0YZNluumGjt4IVfL3xVRYGrYn
	T1Y93mCRtcmK+V0NpmvA1BK/Swqihz6FO8CSFF7llEuTFQKUDHA0Uz9NSjfif2WynzuqwQ/YHTq
	gEheUdZfdYiaA==
X-Received: by 2002:ac8:5cc1:0:b0:533:3d83:c20c with SMTP id d75a77b69052e-53511e44037mr55541301cf.23.1791050224165;
        Sat, 03 Oct 2026 10:57:04 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d59747sm57605361cf.31.2026.10.03.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Sat,  3 Oct 2026 13:56:49 -0400
Message-ID: <20261003175659.23536-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.56.0

