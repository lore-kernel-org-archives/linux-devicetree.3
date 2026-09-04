Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3151FCBE
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557619; cv=none; b=IBz/xvT4X4/oxJJkn3mjAHHM/sW7dVil1mwG4BrkRRa4Be23CjdtNE7eGeA1EZkPVuZEIaOUo8bz1XimvZbq9r+uyAVQ68cjvbAcPNtXMfSdrqk0kQanp8oSvA8M9f8UQtSaCAWa/apX4h7Lig12rKe0QG6NZV+gSRmwaeMUz9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557619; c=relaxed/simple;
	bh=kyhdItw85ylagfnRcB3Fj6tva+77/cxN1usxvESp3pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cumLztBLhoN1LseHrhHSlDAjUty3pjsXVbbdqFLoTVNwLti1Fqdzs+v5dV+/zM4nMTPbWW0ZVeKmZzODulDf/U9ibtpQLK7Vgwvnb3UPjK0COblpCSzgmlwNrGkNvseWhjHZwmO51+KAFy393myoonykvqzUaP6te93JQdbQZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4hjZwjc; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4hjZwjc"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2a449c57so19632361cf.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557617; x=1789162417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=e4hjZwjctOj0qw/e2wrZH/GYvxI/4x9ZlJpqZkx6lWbxQ815514IA4OJC/5j4rvPt7
         JZ/Was+4bZ3lD3p36IBL15dl9e+RIJVfrEdeTqrCKC1AMabS0lJktclFqnCQcXq0grYT
         NtcrtrJM/kbwaoHax8n1ymCytVcIHV4EJ9LJl8NSrm8rwa2BpC+cJ0Esn57Jt33ByNIk
         7IJNu+xSjiU2LuXA+pXoVLGqr9EFz5NOGAtaq62sytjoZSFnyjM20noaZcdqGnLlsAiO
         ImaEDThlpm7n00vVw0oWLX+BswAtatct1s5XPBYsZQtRQOo/w85CjgifXbFS0ZWnBh3B
         WJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557617; x=1789162417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=s/tp12tqAUdON5eyVV4Zfv+rGzWvGZmoVJbYIkWkLqSwIMcAu2Wji1AQhv70UU/Eym
         NO76VFA3F9sHT/0I1Ww5GBzYejTb5q3qscLeT7ewqVDJR4MRrUecJpyfXLeNJW9f5kQh
         KVNktZl7Y8QZCRnideG1xtv2OUqd2RteWs45IqmHxyBbcs/g181Oz5HH+/LwwlK/q0qX
         tl8NO5SrDjcxkjyPATnQyWoht06qO+h/CZvy5U8VGDxB+4rpYOIf+2FbKVs2L8KsDS1C
         IKs6vGBlOBfuIiZmoomMA9fkK6Uh2DwIs990D1SIBmYwM+3vZ8LQ2pjDxU5in2Sr5RgI
         +ZpA==
X-Forwarded-Encrypted: i=1; AKwUvBygnFF9q9uqldkxiO2Pauza/oYfsYa8kE3JvTz75CLVZPkuVdGHPLLLhmojYGdKo/6FLqIa+Y2c7z89@vger.kernel.org
X-Gm-Message-State: AFuF++nwSSjChEbax4AQkLqx5FiPTtOVzaMi32vDyWDdbCzolj9B10Ha
	dsfWP3M7CcMGz6ugsSgVyRP8iQQs4YsNm+0pQB/ASZwhsTp5jOmcOaE=
X-Gm-Gg: AYBFou2I/PyMNwNAS/5ZgynVg3I3VnDAmz62qV3K0s+wcRhempXMcNsRsA6MVRcbCgF
	BCuCT13Wr3F98TpGye81Gl1/EQbLehFH7SMv7lMZohW+uWtEneZj7jxr0IiTx0WNHsroVqGmy0M
	vGPlRW4IY82z5pKZVO3nKiJH95/mRcOKMemFitBSbVa0cPjirzoBMPfIKfBFoww4vtAGPK7Ya5i
	zP9HZzNdN67KSd9Ka9zyiWfWRLi5xVIrhedhfUgP3usUEJ91sx4P5mAUekuBGybN2GHR3Qu4tUa
	1aTnYWy5lhrNO/CtNdwQDguLi2QU6Bt2PfFAR5zbzaTSAFz8aDKAnkVtTnNAktHJkxikXSXi0mH
	ZOlwJWPyu2buaegvel3Du7cNVmI9SjBuUH/U80tQoGngQWOiRGl65fWAoRd/Zep+eg5wHWneKEi
	LL1i1ASgMAuhdmaFGxeNNpVf/WpG6kYGhP0zkEkvdwxjtGZiOKE5ghm++VU7Xr7WPyhW844Tme5
	BopGrJLN5okuCg=
X-Received: by 2002:a05:622a:4a89:b0:52d:8743:bc83 with SMTP id d75a77b69052e-530549f8265mr111105391cf.34.1788557616511;
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: enable HDMI output
Date: Fri,  4 Sep 2026 17:33:29 -0400
Message-ID: <20260904213329.3910099-3-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi Zero 3 exposes the H618 HDMI transmitter on a micro-HDMI
connector.  Add the connector node, wire it to the HDMI transmitter's
output port, and enable the display pipeline.

Tested on an Orange Pi Zero 3 (H618, 4GB): the sink's EDID is read
correctly and the board drives a 1920x1080@60Hz desktop.


Signed-off-by: Barzin Lotfabadi <barzin221@gmail.com>
---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d912..444773e4a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -11,6 +11,17 @@
 / {
 	model = "OrangePi Zero3";
 	compatible = "xunlong,orangepi-zero3", "allwinner,sun50i-h618";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpu0 {
@@ -103,3 +114,17 @@ &pio {
 	vcc-ph-supply = <&reg_dldo1>;
 	vcc-pi-supply = <&reg_dldo1>;
 };
+
+&de {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};

-- 
2.51.0

