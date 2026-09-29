Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619105208C0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699304; cv=none; b=SVpLBfJrHyxjJpvHZNIyu8ASSn+8O2WeZPJzDGjCP1R0SSF8Qm2aywlwQa0KMfE/s0H8lYQN0jBfFLvyOiupnParPi68Rr3HCR1hxOHftkkajXTM3CxMTai8Yy/q5B/wXFIt3xET7jIuez4sGhNme6yqra8v+uxhPZxMpGqlsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699304; c=relaxed/simple;
	bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGcTOAHJkXZ8dlesbDA9vSr4eXtLlW1tpTZjUpkvL2zJO+4zA36JH+6odFPXC95TpdlL74CNnUgme42pLc9ElMB0vCnYs+bIIKNmhSSThHPRl1RRFPj4yZL8R9kudltYiCAZtJUuF3cyoRNmXX59IBO0RisIYbbGFBOa2ycjnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=U90Cx0JU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="U90Cx0JU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso33542355e9.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699301; x=1791304101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=U90Cx0JUaVC8LA/Vv7NNckkR4bLQq/WumHiTz+cxhKVxP8zgg/K05gPwIBgO3Reav6
         RnjOstL7Ztid2+LvjMciM9STqjtyGcwXv/vFmGvfgfg6mc0QPTl9twIKNDCEz5jdnwcA
         hjO7BpeCuqZrbdbaNQDHfemh+Qtg7XyhsLJyFMLSmuKC6KMxda0aFhJLV3c67zWgeRZF
         6KcLu+6KuCZaQePFwkdzeLmlu6zJVdFCif0BgkDkglKIEM1nJABm/8mC148l6k6q/gPo
         z2X17P6X48vxEZVTly3Ezl7VfEMERDDPlMcW4aNfxbKz7UR/lVGu8rqKSSjJ3EAuSIoR
         My3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699301; x=1791304101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=xi/u6wBvlpd5Gj6XJsL7klWeokNYZqU+hjSHPIaidk0iF8ndktrbFVjUdFiNy5a1G/
         RWBOZH/UH3BDLM5v0uhM0tkFsNe1d7gHN9cKawypWTnq0+65U+6cPSqss+R+TlPuhRwJ
         B/8nxKPJEbZE+VLSntHF2nm1Cm0TUhYyCcxBf++0z5ApPOXaM9E8d0C9o6e9Tvncn+gq
         UCKhMahUJJxq9sDD1TGi2KmDG66A0KDtOPK5Gfj8odHaKncSCCXCGK+c1cZbjr6pZFiM
         aDONG0rSVj+ZtF6pulXatCyKzR7IRFLWj5dfe5o9ic1gZrTyRVSoCX5QrwEezLK4j7kO
         owqQ==
X-Gm-Message-State: AFuF++nrBJ6VsHQpjiwGyN2HMU6b/0IWm+uABQ7Pqk4RK9HFSZxX0WmW
	wp/jYPUiWnY3G99GWLHWQNChVKD2VVFbDrn2J5ylq0kl1lQrE6d3kXtNptQaudSooNiN5Wt3SbL
	PqxTYiyo=
X-Gm-Gg: AYBFou0SrHjV3mwYRNglpEB7Gad4pSiWtzWdy9oaYRJHf/8J+ryc1JdE9tmQWtOgwen
	yoffgfH90MfsEeoOCaKz96TDJFPbL4An7p1ayMTGLU+gY8wGo7uM1zXcXb3cklETAEygW+Smddl
	u01Q1Ch/GdlIjxMv4tgSNbdQDQCh8gm7wBU9396J43IPHwhIpXpDKtrXa6H49Wf0u1Ktk+p0clK
	FrxO68ZfsiChWtxaOrkcCjF7LH0OtXsPZW83xQuZELNn9qf30RtdCoPBUIveDpXcUa8siRyytiZ
	viGRybzv1ftW+N5ehmWS+H0Ef7jQ7oE04q3UB9N7DPeXd6CT5oTPFbrnVpAJ/ljgwnNEEE0gCjs
	QzuTdDwNPyuontlflzb9nyMFk//KpOz3Duq2dgRiBmwvKVri2wqW4M/hW92kYDxsBeIYyoc0psU
	ww7Ju5IKje4bqjXyFgEz7P+69N6vvMKfr1z0onrkfPSWaWB2JHE0++DCBT9YivwfsQ8clpijl/b
	zmx8VGQwcs2
X-Received: by 2002:a05:600c:a06:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-49ffd4ccdd5mr169628305e9.28.1790699301644;
        Tue, 29 Sep 2026 09:28:21 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9a7fsm425590eec.10.2026.09.29.09.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:28:19 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 29 Sep 2026 09:28:16 -0700
Subject: [PATCH 1/2] dt-bindings: eeprom: microchip,93lc46b: add Microchip
 93LC86C
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-eeprom-93xx46-93lc86c-v1-1-272791aac875@nexthop.ai>
References: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
In-Reply-To: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699298; l=768;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
 b=QrWJS5LPCOlQ3GzSZb7Rj+lmyCJbhrFVXurWXAap2Vx26sCmrgo8ZPKPsgCESKGvXP9ktx6Y7
 A+swqJK2OOIBlH02Kep0UDLijBzb86esNO4RaCOm93DTYfQ84YpWh2n
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
index 144e86ce5c0a..8e782b70386a 100644
--- a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
+++ b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
@@ -18,6 +18,7 @@ properties:
       - atmel,at93c66
       - eeprom-93xx46
       - microchip,93lc46b
+      - microchip,93lc86c
 
   data-size:
     description: number of data bits per word

-- 
2.54.0

