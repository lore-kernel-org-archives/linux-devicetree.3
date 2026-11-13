Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576268;
	b=SrAZsXK1q1ArpmIt7K5eZFIGMAgLwBmLgYzwkabl56Z3RfUkbya6vIIeHNACREmRvEBW
	 KoJRyVt4/IsWr8JL5rYNLcPiVZ+AX5bmYCZ8PQTv+r1yMji6dPYd/OsXY/lCraAkfcv7g
	 KTzZ326qpRnJyDK3TRroxW535VLcw7hVhwkGxNszV3wzm0w9uPDgbCgcnRVUm/SasG0SV
	 E/YlrmkQB+BT0s4589VOChEleAAvmz0RQnFj8N1ghQEN1V668YRHCdpkkuWa8NnRKt62Y
	 d0KZzMNOM2dVnC23oO/qVSKithAjUtNq8tlgEP0M//iNab5ehDy6G0Ny3GbWUUA+G3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:Content-Disposition:To:
	 Cc;
	bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
	b=04I4uEYLYS2ukmjxoq8dD23IHzFRG452F2F378cHaQUFbBT1KxG3g+afgSbSpvhqushX
	 LqEgyDKSx7zti0F8FfPi7eVOS3gdctJD8JGD/8N5uDPAhkoUxqKr+wYmhp4I0ZgcvgmgV
	 PTUXNvASNl+kEBhTWZE9Xzla39oI9gJ9YTRYZyVnFxDbXkkZ1lJeY/CZKJxEOWJ2K23XC
	 BSQSJdp2i54r/k4MtBdjJZJ/y+UEEc0vqQhIZSKdckuAq6XProjohhNeZQZfwMJUi6Tu2
	 GL5h+vaPaaSKLvQic+8nssAlB5VJb9Um0ZAraI3k8j/zxcNmOabw+xDR7+b2PrOZnVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk;
	arc=none smtp.remote-ip=74.125.225.72
Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25296606ABB4
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25296606ABB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48df4afd489so168860f8f.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576265; x=1795181065; darn=vger.kernel.org;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=MXsmNfMkwmrtzH5QjA2Wxfle+/oOPLkWAIi6ePOk/jbUkUf8919leGBOnEaDEKyqUF
         63XyT4w2k54VUgxbkgF87CmSk4kBwa7mGWNgsu37iC7SdvqLPNVm148QmlA/lVLyZLBk
         5ecd6w/ciPaYgxpW3VU6mRTOSwEyripecZW++PkhfXPQouAY6vUlLpy3dZII/WgBSyzV
         MLuqoZNff+l8SDfNOvkSsOZrU49UGiTb3RhlWr2Sk/7LBh00bwFjWInjB3OjyetRvrY3
         u3yhSqV1yi/w+7jrqSo9Ia7xHTRR94OM3faplZg9BwBuaCaY8sbI3VFyaudztnDV1b/j
         EW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576265; x=1795181065;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=q/2spCZtTlckXYoWyOrhE2QeFItSqPv4Jhe27o32vcF5D+fP7zjbakSRC3MG9NmLCg
         wGSrFssLghtX97oqPKSNYDMRJ0sKHC2o868KHCUPxvq8WQhmb/kt2EKah0ukIkDeMSdk
         1x4Ei26zwCfm6DqoPwC7kp3FTgeciJdTNMYnQuUAwIMIqHno6b3HAVN5Qs5Zsb4CpjhN
         iG3iZEf2GHPF0vOd9GKRej22Ddj+3F/iol5Xn8icwYloPhJD6Ruxgc7NR/IpAMRzD521
         iGe2getHKytL2UVphglTXEIixlJiWj+TNKGmcHTtr71lSqawN5VuRiHTMSlURn6IRl13
         fwBQ==
X-Forwarded-Encrypted: i=1; AL+hErE8iKg2kB3Gd9hcoqoD7Oix3eJJopnloKjj/NPnMHgEeWIoGX/uX0fveqMk4zyajShsBILoSJ3t/UjY@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xksdw/nw47pmFuHgkMtx4zTc4r1EbwD7sBnY6TK9vV6tsJq9C
	FAmKPIEXmTowg8P6FcjkeL9KKupc187XxrsnFNfmUacp6yuNecXJVXse
X-Gm-Gg: AYBFou3J0wJvPV3isS0KFLrM6maKJS79h9lhBeqCUTNPFg9mIK/yyb6H5astKue5N75
	CIonlDbku+4I5CdAk598EVc5iWQghTd7OQ1GDYHYN6O1K9VsOj4QuLF+3EPSUAFXPWD7iKXKyk5
	3rCVZrlxSMYHgIv3eiF6DdrZm06B8lKVfgljVLBSl1q9sfbXa1vBleFYf2sUN08qiOJ8nlJ4lBu
	yR4H9ffblFh0VbGhbDjbXgR+8i8WY/9WRhb2ljf7SnTR2fKpKfOu/C5jPf34zk/zX+bynXo2g85
	JWPtt0M+ugDW1D1k7fLhC/D2UV8X5YMERcnC3X+csGil/2z9MkdXI9ksGh1Ji3bfOJrxArreuHF
	bWUJDDx/y80tFW6OE8P5so48zB/hgthzYTJRHAoHZVIxKCCLdJXZXjB+av2UC5AvvDFP+BgGEtu
	GXe87EascFu8JrT/MlGu9nHuml9Qbs4Fx2FUJX4A9AT7y5LuEK0obsFmund/+fsb4/B8x3GmFWQ
	y4DyqHZFWZ2EPQboxD7zY4u9MKrlqTDB8edryDBcfMF6MWY/pr95RfdctrEIkI94+jLeUjyr2kx
	nYK6naAw5XgoT9xh0D/ttMyXbR/XMQ==
X-Received: by 2002:a05:6000:161d:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-49c74d2daa2mr4041400f8f.55.1794576265256;
        Fri, 13 Nov 2026 05:24:25 -0800 (PST)
Received: from [127.0.1.1] ([196.237.238.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm5377498f8f.52.2026.11.13.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:24 -0800 (PST)
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
From: yass27106 <yass27106@gmail.com>
Subject: [PATCH 0/2] qcom: add Asus Vivobook 16 X1607QA DT + LPASS audio clock
 retry
Date: Fri, 13 Nov 2026 13:24:21 -0000
Message-ID: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
X-Mailer: git-send-email 2.45
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
To: andersson@kernel.org, broonie@kernel.org, srini@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com

SGksCgpUd28gcGF0Y2hlcyBhZ2FpbnN0IHY3LjQtcmMxIChhbHNvIHNlbnQgYXMgcHVsbCByZXF1
ZXN0IDE0MzkgdG8KcXVhbGNvbW0tbGludXgva2VybmVsLCBhbmQgdG8gdGhlIFVidW50dSBrZXJu
ZWwgdGVhbSk6CgpbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUg
Zm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQogIEluaXRpYWwgRFQgZm9yIHRoaXMgU25hcGRy
YWdvbiBYIFgxUC00Mi0xMDAgKHB1cndhKSBsYXB0b3AsIGluY2x1ZGluZwogIHNvdW5kIG5vZGVz
IChXU0E4ODQ1IHNwZWFrZXJzLCBXQ0Q5Mzh4IGNvZGVjIHZpYSBTb3VuZFdpcmUpLgoKW1BBVENI
IDIvMl0gQVNvQzogcWNvbTogbHBhc3MgbWFjcm8gLyBzb3VuZHdpcmU6IHJldHJ5IGRlZmVycmVk
IGNsb2NrIGFjcXVpc2l0aW9uCiAgVGhlIExQQVNTIFdTQS9SWC9UWC9WQSBtYWNybyBhbmQgUXVh
bGNvbW0gU291bmRXaXJlIGRyaXZlcnMgcmVxdWVzdAogIGNsb2NrcyB3aG9zZSBwcm92aWRlcnMg
KHZhLW1hY3JvIGZzZ2VuLCBxNnBybSBjbG9jayBjb250cm9sbGVyIHVuZGVyCiAgdGhlIEFEU1Ag
R1BSIHNlcnZpY2UpIGNhbiByZWdpc3RlciBhZnRlciB0aGUgY29uc3VtZXJzIHByb2JlLgogIENs
b2NrLXByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCB0cmlnZ2VyIGRlZmVycmVkLXByb2Jl
IHJldHJpZXMsCiAgc28gY29uc3VtZXJzIHN0YXkgZGVmZXJyZWQgaW5kZWZpbml0ZWx5LiBBZGRz
IGEgYm91bmRlZCByZXRyeQogICg2MCB4IDUwMCBtcykgYXJvdW5kIHRoZSBkZXZtX2Nsa19nZXQg
Y2FsbHMgaW4gdGhlc2UgZHJpdmVycy4KCkJvdGggcGFzcyBzY3JpcHRzL2NoZWNrcGF0Y2gucGwg
d2l0aCBubyBlcnJvcnM7IHRoZSBEVEIgYnVpbGRzIGNsZWFubHkuClRoZSBEVCBhZGRpdGlvbiBp
cyBmb3IgdGhlIHY3LjUgbWVyZ2Ugd2luZG93OyBwYXRjaCAyIGlzIGEgZml4IHRoYXQgY291bGQK
Z28gaW50byB2Ny40LXJjIGlmIHRoZSBtYWludGFpbmVycyBzZWUgZml0LgoKU2lnbmVkLW9mZi1i
eTogeWFzczI3MTA2LWh1ZSA8eWFzczI3MTA2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4K
