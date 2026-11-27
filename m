Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785906;
	b=jexpxOLJ22lkjVGBNGknkSxi1McsUzVvqfZ0r3AjurauqcNRGy2JQfrPagM9lcPRr7Kc
	 ulDjg/9FtsYTVj032Xf76zRO+0k3MvaSxrILP+0NFLCBhz5tM9M8yBBDFQyG3R188Fcvk
	 zVF4U8ot/6Kn6leFP9/OSgGoMa4JKzIBmUFDZ39yZxwyr610HblxOP47LxzqxovAEaQmE
	 kernl18sAhHHp5xUe3HGcGudMyN2IJBfr83oK0q8Xm5sYevyqJVBVAmTEuH8qvM7UM21+
	 G8638DeQ/SwsMVn81UYyT+bcsSMTc4P7yea+h4SF/tyyCLGkqKkr+JLA2Opz3Rr2SFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
	b=CnrO12Rv0HW53xharQLzsBR5R5PcZe+zNZ9KgD6BdR1+1fKMk5RK3hVeTpbk6l49Rv6I
	 BiWxrbleASvR8JH8ckq2N+XKk8eNv4MwLoICX92PoxmYy5RJ5bbQBZO7ziZJ5ufwk6hJ5
	 jnWjoo9xg1TcM2IX3q8Tg+qZqNxzcbsZ8EMsXxfSkn2wc3WmdYrL/fGhlnUEWFPNmNvOM
	 9dVthrHDVKqGpiEGOcOHmxKnoMBB1UW9OI2pVx/4S9RRggPEZDwnpNfBPyEfecmPQ+UAE
	 DiZgbndrxvH8tAPZd2MRAchxgRElEVwr2Sb4LuJP9llHvGwIaMTyc/JTMEfirQxSM7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F0606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so11384437eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785905; x=1796390705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=ASRq3L8l9m3LcjNpF0t+eQQPUJ9Fwq8EvMwI0BCwjgm3gdwZXYXEOjfQMTMWra9hL0
         8xz3OMkXgnsoDvetucfD9dY+3JNOzS2JndsgC9nZ40RTewuWaG1GIPQuulocrlONEYvY
         aCDXfa9qMYpHATNUIfUftcvdb9G57omxSKu+LkTEArByW0vbZAg7A3DzhXNpkSmi2hbX
         IjOLD14TmMQHkU7la0SUtLfkmt2vsMhcpNqaPBgvvP1MuSb+R8Rc5pdnchJiD0tK+yRe
         FQ+6a5jX8pvoRDPRC5HmnxJkjfgGqqbw65ngjT0En8kdYFjSMES0sLeUKDp1hd9AbonI
         4VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785905; x=1796390705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=faJEyx5wa4ZSThJIi//8AOj7G+IG4oJPRJSFppqnqZ9o/Wj7Ncq6iebh7i/MYgiVdS
         GF0+P3kV5N9QMivMiPNq8WkG98/iS9UxHOCfUA6UF9BVdph6lCWjCOoKQFiq+cHWhTDN
         Wc42aRbArQFk35RzHlMlQiMuPxb1380bwXUiqmepvcKK6Mo8YElvvceNjzq2Qe968Zec
         EsBa7oUqJoZAJ4Gvq9sy7p5Fet8c716jZ9zILLjUYOyLTlIXeNUdx71jPemqSwmcf71f
         EOTlCS3UkmwGQhuMiUHXBSl6wn+03y+FEeX0rebw6d287M68453tNsivDy6BrPsDCXMY
         aQcw==
X-Forwarded-Encrypted: i=1; AL+hErEMp0LMCvSd7vb5PxEb+giYMt4r9mwJs+oguKpicJOwmVzxJ0olfkd9o4fVhPBWRwBinaZveX7Dba0d@vger.kernel.org
X-Gm-Message-State: APuU4Z8WBfwVzWA8yjthGQvBPi8LVrAfT7evE5qkrzluEEsR1TJ6uYbH
	8OgV6CX7hLlLSerLOAkMZNrqrVZboNynPwBWdmAwdqt1N7MXtPT5E2FI
X-Gm-Gg: AZFdTZdX1fIJaYOK7wOPINmogjeooHtFSFgGndvDsBgaz6Lsj03jASTIRpHDVThWlcr
	yZ/UpuP2S7GCCUaZwIb3E16zpXhgafD97UUe91H4pS06tsSgSk/nEuia3twLKolG1J2NbbTWAOK
	5jVl+VNJMOIcJq8s68+6f+294N4d7nJ+sKKmnBG9xx4+tP15GgUZE18AHjBuvOWmNyizlO1OmMS
	H7RKYm1QjlI25vcEROjqHC2peiB5DaNkMizehRsArIT/8OF2HaqMWTZ0Fu0UE6X20x0ek49oWzj
	4kJ1r8oEeQwv7WEMOfn8NN1bH95Qu1C0T/uoNYKTyvvBWGMM31EKuYY6IsROoKBAID9aBT1VchJ
	K1wzSozVTMAwedq0W4qxAv8sbEpJuAnFWxAegs+usfOR9X9KehsFn69QlvPjw/a2Bp3z2B1VD/0
	t+Z4y/A/TBf5P1tT0DFT0MK76BzFBjh5oV9zHkJlg60s3ds8cOTbDs1Mupmld0t12lLcNrg+Db5
	GJdRnk2YhRelsA1kM9fah/TMRbcQ2TmNc1OCiL7XoNR315v7SWE8/c7cp1sqnPn7rThc0HN4cZz
	R5k1AawEnCaT7YTK+53G2i4EGTwDiqSFzcHZ0iVqtZXAKFkwxavj
X-Received: by 2002:a05:7300:a506:b0:386:c960:278 with SMTP id 5a478bee46e88-386c9600557mr13797608eec.17.1795785905017;
        Fri, 27 Nov 2026 05:25:05 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:25:04 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 18:54:48 +0530
Message-ID: <20261127132449.89081-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin is not connected to a
usable HPD signal.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..8d09c98ecd42 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,11 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

