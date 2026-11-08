Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174628;
	b=Q3wnLUSG3nIMHCi2OT55F+fVIlK4fG/FqUBsRNYf5bSIRYTRourebLOq+W3759tf+FyK
	 JK5xSQN2BS0Yr+OhuX0SeDOgy3784zyCS2GYl/cRV4CbPomng1Umehsk5f0evHWgE9q8P
	 52iTFwUhO0HplOgpQWPcKCZocVOQZ/cn5r2yBKkml7VW2sSsq7f0qsc+Hn8DRvHCJOXXX
	 hh/53BOALyNihl2sJCssQ//ygb0MAQO8A0mWA9gJ9lGS55UcQZMqwlvOfpfBzR/g7rDPh
	 N0pkfUKHFGUs6lnuQU717hdMJoMLlPRTWgr+Pa5M4qB26yYVoeSQ4dkL3oqwP8m0ESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
	b=JK4lUKRC/5rrdlCF7hBs6oErdHD0L670pun6kERwQ5RH47HMZA/ZwAOZXA98CUvxusO4
	 HpiiepScvABS/b/Y4KEV5i3mNo/JpJYJWDh8q5g1MdGWJpojXV1mdaDmHTYhF+Td3lUS8
	 WUdRpgcfHTGA7WGo6NysgTqTczb8HNliK/+JpGjhzqMHopXjtFCWvwSFkYPq9SHMYX4oq
	 QbRDz+5B8TEp+GkglgnpWzlUdpchWuQs/FiZdFfBOOqCvrZoOr+UlQPhtr7rZcok2YGpW
	 kJOaGVCCb0D+k+EF2XDhqAdVC+Vna8RBkip0R6Va4vFbEWFWHFYCZNAF0rzjoZYs5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v68hfK21;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F06A606A32A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F06A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v68hfK21
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so194190eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174626; x=1794779426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=v68hfK21lQ5Hpp6H94BkhyIKicXp1oMnounZcROjkcX21Ge+SN2YqDk+BUSXNjCv8C
         9ekErNOYK0UfM0HdmxgwZ/eJZ7vgFN5fa/MITp3I3OzkMILCpY9nNN8LS79256xGt8Zz
         sA6qsQs/H9/OA71UJltSK7zSXeMiWsHSbwYJ44AjgBglLq6uhW+uSoGWDo7d9zd2Dthr
         j6oQunmI/GnIQSGII67cEGpdupg3RmgjMjgE59A9xAAa9mxaO4ehBWxu601Zsmr19ui3
         5QQxcugtos4Xulm/UiYO8bvi++fGZ7lUWEE0rCoyo+aqcYEHr/hoLe3+Ng7hZsYzsQaZ
         +16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174626; x=1794779426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=iNbWW0PMuiPgGASwVW3QH+c8ShJi6NB/rw6t+NwN9h2u162Ur5AmCJQe8svekyu5r+
         GwB5ddIrDeWbxwPOVwtKMZ6Sl693pfnZ/ATyiADyshraP9HVyPxNp4oZWzaTDioZCBkf
         VPsCIOC8Agm8zaXVgoiO7EAYDRXQfvDJpoDs6jCFvyB4ucL9ISpmpu2OvQeu5BbI+7X/
         BeGdrHMlaPRdv0gTwNjIawlzLSNJXYX390yQcKY/pAOtQqrmePzcIOuW7eefNi2lwtNH
         HHUo3jLhgof4QtajU+8wF/4YyVHqUSrafYvOWIfysYMLRZl62WljbwU6k9q+NUaftvfj
         z3Xg==
X-Gm-Message-State: APuU4Z8Pug3EPRgf6Xa2VDz1FwxF419t7O2nJ0Kpn+qkIXCjvnm4Cd6s
	PnXD6GT3A0iS3xnGXO4c+H+c3iiEPfEUT98STwsCtPbOp90HZxY2zObM
X-Gm-Gg: AYBFou1AmBckH0qEBFWS6tjOExLiif6p2fqTIjE157ImjqI3ldCtEPOGKqMD7iwXGqs
	55gI4azos/CVYrID2chCEIBNZB/Pf0jG7WkeirJVN+qoA3aBFvj21uVILDxSvf3Z0VuyCCaGWRS
	p+OVb9zsQ0GhxMXvTY670+TBSFj5zv2W8yzt2NQ1OxElUNg8G8JGo03sC5jVCd02ggoMRdo31X/
	RP9HN151Q65ft5Rk8J1l/wwoU04FcCX/Gc0CQ3HLpuTAfIsHKhI+GYq1xNZQrmoA5RekBSjhrRJ
	3znXED5t8Tc3CPYCVehFe6iyNXk+d+I8Mj7XBKIaYh7askCW5ASQCvPObEj/jXc9HV9ky4ncwmH
	OmBGCGdEtzyZaCOGSa36acObNF3b+z/yR0T0Y0amvZWilmzHzHFa21RRCnDNBoO6XKOItZY/Gjc
	wmuH40ioYLamtBmT4XBP5IVQqR0xNzAjYYASbbtFt8GGhdhGN5VDPT0QsRdDXcWcGNC+OidK2f6
	8yjQRAoVQKgl3gljbvxncFtq1R4bGw3LrLTykmPyZvmQ8kSi7Ruut6rJDf55/ICf/XF8X99Lvnc
	eDb9Ka5Krb2G04NMyBIXtyWguv0w8i+NgWOov5i0kK0KXJe9cA==
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr4822924eec.8.1794174626129;
        Sun, 08 Nov 2026 13:50:26 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Mon,  9 Nov 2026 05:50:09 +0800
Message-ID: <20261108215010.351256-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215010.351256-1-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..87b331f296 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - adapteva,parallella
+              - alinx,ac7z020
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
               - ebang,ebaz4205
@@ -34,6 +35,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0

