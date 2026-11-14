Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645025;
	b=0uugEwhTfyvaukRc0DuGcnp9TbSSFA6gEBRZWBUPvqDmBQo53mTDQGugVIL+r+XEXt0y
	 CswnNenrSOeJM/vsox70OE8u/OBJnFrXaBcdBzaBMgorhq2+g7tObNvSschh9wsvQGeRS
	 bFCUITLYF5VAgveZcsZgsmrpelzRp35ShH8cV8Dp4UeyX2VrQLZQt3zMN2913PzIEstaB
	 cyf0xACI1skwm5EQGJjvTl3HvMkk5viboieQ+jYoe0oWUF4oXZUotkABt4CGoL1G3tPC0
	 Mu/UaxUAtroQCYMaWV+kyBMlFHJ1Pfw7kiJKDoYETOnbiWxbySJncezzEoyZN0ZjYCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
	b=rgkj6b+/r0qiueXXAGYGs45KCMmMVGDsmN06qFx21nwRIiws8saV64EQ1P6Q+ZCpE1vQ
	 U77f7vtaY02WTOXLwNAKiCA4CuK2yGKKeGkPRMWYS4HqpSY87n2EAfZZX60AsA/nFTnd+
	 uj8PUjPEjbTkzF+cOQJ6yz5Xw++O0vFtiH3yAFaK25x1Dya5usKbRU9VUJooNGV93ymhi
	 iDPId4Rn4mp6Hiwr3/XotwbXI5HHnjPmQmSc8ON4ZuPWRqXCQqKxcm4t7OmDzHuJx+ixk
	 WQnuohWmA/PFL+LwajESnbIs44BfFvQRak5ezMxhclWUpOQdWQFYTD2URzO0/9iXHAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207F2606A336
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207F2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso5595465e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645022; x=1795249822; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=0qR56hQYIKWdOxVpc5j13KSOTAd8LvtSa09xdM/++9azQASY01VaY2/N7bIxkzHVQV
         uneV7DRJvWG+VRc6KRO66LSYMhG9aTuwpSiOFSv73W/DzetcCerEDzEnoxAr8js528EH
         nUTPKaAk8M3xhZbjAxaodYkT3bJ3vZzUrc8MD3nwb5I89mxzZ8VSalVq5w8Os3SC7Yv5
         Qab1tXA+MtQNKeBlFZJ32hBa4E++V/vEjpv+ymFD9oARpQcuAHbq1J9fnvsG2w1J6B2B
         xudgu0dFaFOYv9/QgA48S9Cxy+NlxC5paDnWBPdOaMkesuzTTvsuRwlZ24sDoPMGS3qR
         kEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645022; x=1795249822;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=gtEVJyAnOUbvk0gTP7wrnlGBk9X3fEWvpPXgf/QkDEPfpLWTKc2a3Vd7ggEPG/hjvO
         QmZhzytZm9vhZV5v6xOztnU2ml/OWaVUg4o7cyr873jws2SxCEW5qZ4DncpArkbRZTEi
         b7caylmTumeckZrlXP9M//FiPXjVg9iCB0dwrlTjAQ6vPlUYg/+9RNNRmvuh9LUW1gi2
         vZUE84Pzme4Veh4DSSCf9UqK3hLRoQc+Gz9twO1Bw8RYzONl+m+FNHnEs++X04LYXIA/
         GfCwMBeH9GfenfDxmWAS/UYlx/pnlgEcdkUlFDXQzYrZ++Zx+NDIdXODipoTGsR/rOWJ
         oyYQ==
X-Forwarded-Encrypted: i=1; AL+hErE/ZFVU9M4ihmkePCHtarw/6W7BAvD3YxGrUYUdlD1rEXYohRC4eQTh8VJGACRqIuU/+MclViHPmhwk@vger.kernel.org
X-Gm-Message-State: APuU4Z+5nMgqGHHGZXU/uYpYVaZCfNPgAB2CmRuXUsfhfnJMLi1Ed2Xo
	kaZptxdns3o8cuVQlm5suQKmt+cgsz1Y0yJO9auqhYILRbj22XLpofNC
X-Gm-Gg: AYBFou1DkDEt7kjQUNEZCdhK+phc4P1Ri4j8z//wBeQrXCCYnUsYQAfRzuxcxEF785S
	zNRvWk8Dsf+if5/Thc3D1TCzrxRDZNViAuCQIOy6lcB4mdbb/lk/NvKEFEKBl3aV77JYKsIbpKR
	t2jmow5CyF0rW30U3UxgWUx+V3wcHasZoce0eGTHrGpQjAIGP7ZSfgtCyf3382Ucyhp4kYIaQ39
	yXuEpXC7l4kBTN5GCSMKW1QL0+9uhUKjZDINJg6rw8KRWNiz4ab9NMYZZ0JmykPueRBMYi67Tz9
	76bFHKGLWmdaSbAfpy7C6mqUBN2EEbqf+i2Fu8kxbGzZHJMqlFsTB4ZLKitpY/icopg3liMwkoM
	qnffMRsxE3ZdjQLho0K4CHNwS/pgMDi9YsLXccrcBcbiY82LUfEE1ZUp0f7IcwNinyzlmx3T00K
	330GQO2CEUq7ObLbMQSCRBBP8/xnZOqyPkMopL3JaCi72HbcXDeGmTW4f2BK/149g/UFfxhHijC
	y2WC8yFwSelYfiOkQd6YFzonB55PGmIcptG0DjSQ0sNcUSmd8hy
X-Received: by 2002:a05:600c:2c7:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb55a71180mr65200945e9.28.1794645022425;
        Sat, 14 Nov 2026 00:30:22 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <ffa1da6790284f668c860bd21203014e@gmail.com>
In-Reply-To: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
