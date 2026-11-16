Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862540;
	b=ViH3DQdOWWm0LlnRVkO1zAqkY5EEl0a1e0OktNkiLL4Z9IyVyMQtQKJ5RpwpvnxhbtI5
	 eLdWmNoY7apro3KFS/0787EM7vgBo67b42bj9VX9FgCkPBQECADq2HswMZ/YIQ9XWpfpE
	 sdgw0/UzsEoIRPOuhHEL3OTUGPwFsTmDQW+4v+ZOnMdr7uh+FwZTUWXy+nCxQefwIj/gP
	 Ks0FIFibsmCosb9yNuagc+0XMBJ2G/lmI451hxGzXAgPXx4+5g4+DbbIrTg22qDlindUb
	 DvT4OD8mjwlHPbxtQgNmK1MBgeq/8fkK9njjfaxoNNSXxXIJrCmcwuzZVqjCJzi5ETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
	b=MxVuSxio9B1qdQBxc6AFRpx0bKJ6v+xDs+nSxMAYX1KFXztWFlqM8SYIbqmWxjPYurfu
	 bfBV5c/l3v66oIH7iWRGW/RFrePV/v9pPT4U+QMSfcY4Hl+4TpbxoVR7y6hs+Pn77vswP
	 Il9TjTCFy/patAWoXQ91vkZ8pf8svOal1bocd4f+hzPn+uhxNwbY1oIwG27ym7oBws7oV
	 Qv5yP1OUkBp4uXN2h67EAW+K7s47vy3nf1+oHa5PYeCH9w72d0Q/4dBrFRRJUW2NyW71h
	 xkB9pZJT/+6Ra+umg6+aMjEqsEJIUw9mYgGKUV3H1MUfwCRYG8IgRAMH960CMSQoSAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BC606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3BC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so2191175f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862538; x=1795467338; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=u2QgY5C3if5uWiUzZPM8txeCtbFhDBPrzEMoHeTc5cOUW1a6m+yJEOsHyjTGKYv5Br
         2hSq/IcbD6pZi+sd73S4n67ieExHp6zRxGM9IjP+O44xbz09zLMWbowhMeyyRAWGbIuK
         Q7Y8RY0lJKTIww8tbVcR0rzr+fKDLuN29Fk5SxwLtIviFdn7AyBhOC4fGiNLluF5QZ0m
         G9wxEbaF3SDTPQzdEUBgPeNz+y+ca2sV/soJ0BzaWB6rstoI+PF8XC135FGOfQ3f4Ijc
         J90MHeSJ3ULZMvmhEqS7GuyQzjZtkGPyRlPdp6pUkM98FxRrWTlOGvcW6eoD3yUkCBkS
         hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862538; x=1795467338;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=ItnQmoQPHXPwE9JIpxiyeesarNV5yHiCysgR1XMAug3oP1hbLPc/trf3glbAKn/b0B
         JMudRoLIJ43ztaT72krU6zE6h6F0DljgsCoyosvAfQ9H1Q7gB9hxnyjfEQlkOUdIPL4V
         HKnMH1L7Hn5yiFWEtgsPHUhmp47wiu+2qGF+ShVfIGDbm6clKA13BbcfNDyZhVbAeT+5
         9i7c7tXRT6Y09brYEnEpexCfgyRYskLhzJNaypGrxl69divSV5pix+cAPjGc3w5AklCm
         bYIRbRKF6DdEs7AHXj4q3ms11d3UAEOlEE7iN/svYNKlKvP36VmHLdRhUQCAUftCq/16
         mWTQ==
X-Forwarded-Encrypted: i=1; AL+hErGkFGRsvqVQcEvpz0ez3I3mCs+LZHi8p7HXNke54VKMlcxn5DQwNuFT96sya5iYEUFVWa0munCmO92I@vger.kernel.org
X-Gm-Message-State: APuU4Z/TgrQfmNF68iYLtEzXNWSLrg6TX9pBsz8lwQW+B64e4L1HRwZ9
	vuBFA0DioNbxzZQkkxNnbBzRNBBxqHqja25zzHYU/J3rdJ0oPbN3n5Wx
X-Gm-Gg: AZFdTZfRddgjy8gudtZQQwdk/wOT6KhLtUre2wLjNyAgHYOjTtvr0+rrsOUqyBLYOZC
	KeShXAyTfvLmQ939F6p70A1Wskub5E0chDfhIIb55nSylE39/oHBV1Nk9Mpxyq6N59GMbQE6/aq
	IKuTrc9RLKYeOC+CwA0287dYzpSFMjLTC19MJsZRNv/x56N8p940QemwleMCyzRqLtVhv2Wl7F1
	HFNvNAZY4agGMvUC7lg/OkaDaFV6PLGqWVx7yNYygEbRX2IQyp9GNPBrlNASUjFObby4/TlVsDy
	IfiX9ZhQL+HkVg8FFR4Uj9qHQko81RKMbnTz2eOpk4YQ8jpA/HuYeZfQYBG6zW7tDrUJ8/Xwm+6
	4pVk/wjHNRF0J80TWoxXPXAS3677HUf6uDvUeNqXfvsVSaAFmAV7ueI7WNpzXL9byFwolzpd1bx
	ctlwPdzvgVGCCfVw+bl5sAwFCNmHx/7Wl8og2zUW5z7NnY2mm1a1d+dOeXMppZqkMonqyaqNrHt
	xKmGuaFj5RUO5Z5qkUpvnlLYYhJRTakeoZ6Imr0l0Q3kSJyPirf2CRI
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr27391944f8f.23.1794862538469;
        Mon, 16 Nov 2026 12:55:38 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:36 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:36 -0800 (PST)
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
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <954a5e65e7424694ba29836fba08c802@gmail.com>
In-Reply-To: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgpBY2tlZC1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJm
MWIwYjRlZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9xY29tLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9x
Y29tLnlhbWwKQEAgLTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRl
bXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYt
eDE2MDdxYQogICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAg
ICAgICAgLSBocCxvbW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5r
Ym9vay0xNgotLSAKMi41NS4wCg==
