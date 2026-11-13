Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530247;
	b=JHH/1PvntG77div1AHCxDFvMyLibypBERF77/0ZPRtk3QmWkO9HKx1idIyUMk119esSX
	 kM59SCHbae4CynZmaWAu9hg8qR/nNTvby2SP0e4zZKgRGVYzcsCfHL0g+D2hJdoKpCcbW
	 QWoy6CD4thpKyqmJyDg6W3NAo0ePAKxn/zhwJsjFfnPrjvLkSrzpenvfr6mXF5uAEFYvs
	 TJElePWBOCDpBW4me6YiCV44herW7jrSICGtoq7HGhTYDPhTnUB/OD0whqi44wEVbSco4
	 pT3iDL7rI8Gn2lD8QwqsACe9mbvQmBz1ejxc4s9PFaDpr5H1QpWSnWgdXTNxmBUDx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
	b=ssJsPHshD8viDyGzbVJveUsAdsI7RmusMlaU7p5xWoNP3J3OICtgQCcHYVuoQKIo1AFe
	 LCFidy+Ir8fEOcaOQwH9HETWWNqgD2HOh29qod9RNIqqeghbIDCs7hnj3NX+wJUHGc1Or
	 olmaPw0zDAbkBjHBR6ych/Z0pCr4U0JLnXgs+e6xFVZv9Yc/YsYocbXizBpN9JkjgQ4dJ
	 R/KSo6wsb2etuX26fpzCjCXONqr/uR05QGjeCJ2We9pwD5pnIfpuEHqI1wLA8EaJ+RvQX
	 ZtI15EePK0elyHGOMPt5j6hwKCzTanF2+XxpZPYh7NfUGzx3jHFdBWsVF7yx0/LXqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE9606B565
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCE9606B565
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491aaed7565so135198f8f.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530245; x=1795135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=hTEz5d3WaREJ7ysbOywNEF1KN5ZyBCj5690RiF0asHXetT32w34pPUJoObRiJNSims
         XG/c3EOAZP+oTRD8QqudIefWN1UcSGIaxz6drRr2GgcmjRCBctCIqrvj8wEhOk127D1G
         XsCGs856Lwncv613nP7uDgbfZl5yE3c1C9tbQ0pEhsd4Ef1uDeEfSZXQMMe1xbHbXy5u
         XezoQ5cMs9fN0y7kKRhsOKMoI5jtiPIurMEQJ+eZUxYRX2TCoD9vMxto7Pr/c1JjMoCW
         J1zfOk98xReIr+9782nVk1iwv6lHo23M8tOUY+DS4Sop7VIUchrHUWqtWxctxelkW/Fh
         lApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530245; x=1795135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=U31vSFC+5kMqlBsV+2NRAN83p+r7LDsMRtEh3im5qNJJRr3JMru1QvbUa40lWskHMk
         gF26d8j+H279HRhuh3JDnYdQPVfjQ3sRK18mOZh0DBs5UC/nDWz4vOXVrzXUDJVgP/PY
         y7y66za+Vef58+lyzvdYx+EkDOz0qyYp3dQXKKxgxNQpbuzrvnmrcP9FaOpPsZtd1EYh
         QckYdFiWkbNHAo6TfrtKhd7xO/QOM6qbWj4fQunqDT1t2U24FSvn4CRooDa9p6YK/4QS
         nMChh8gJp+PsdqV9XjEneLrSyMZ61Qy1Vx/kmoPAkcv4wEoPTmEGW7hyejbqy0mpcnQR
         YmhQ==
X-Forwarded-Encrypted: i=1; AL+hErGy66O67/BgNVoSo1Le5tJ7Fm2d7DyjNG39KRHwUN7ggGf0FOZTCkWc6CVacicW8Wl8Kic9tGkUBekq@vger.kernel.org
X-Gm-Message-State: APuU4Z//jSDEiYN/MmoIBLWk4j4dL5KfQGnwGTdh4pEL0V1Yw4fsFJdl
	TXnAsz+J4kzxpiPpRmvfBos/vlwHB4qjQz/KHtZ0iTFgMvGUAOfCPMFJ
X-Gm-Gg: AYBFou1/GewUnPynpHh6wuHA3WhGkkLM7s3Cuzfgi+C7fy3jy1ti4CdfEZsLmXpUIpv
	cdscKzhxWlVpRiNtKJ1Dyv8PTyDPW2hhrpE+Ve5vrLu+zUGL6m5cl1jcep1e+HoRSbkPvxa3xJs
	+rfrIkE3pnSVsrxz/d22o17uef8ZNEzTDMdTaNHIyrxA7QGa3ddXbqQamLDjXiFZVucf4n6oBfn
	R8X/T5GOFlJtH02p1dd9//wjs7+fvGcKWrr4CuZBPo92SMi3j28WgO52KdGA6PSBKxiyLfpwUJ+
	nzTWqT5xB/7vjQLUgEe4rdlrH+aQ1Fh5whPKM/LeWtQ7zJMmFdaV2gxxSKhGwni8febBB3CgPGt
	Dh8wSYKS15gvdSvygIqYBfBRvA7ahvG807NpIW6/KcFHXmb3pcU6QT8obI2u5kHZr1ZKZ6f/YYd
	Jm/APXo28uWqcYtLaUU23iwc2cD7nkaK7makf1Sq0ZFcYyIzSN/phgUURAcWR3yVGj5/O2RZZAH
	COSP7xu7uVxOe3U3kMD9zO/AVNPXW29ZsAIRIotre92vnF5gz1rGcFsVhOzh+ISmOP2JvmtQBOS
	eJbJsGDviiTkZvcLDrSUZ2JcZw1qJg+qc8FZ7GZEUgn5KGEpx0XC7KDlRZe4F+EhSalKa43Xozo
	o0YhoU4NfeQXJnikcxlMJfv2Ya2rAlaEKkKpceAPptDVAEvwPAIVBkXZaqQfZKu+YI+qnbXPpyk
	+RoLCas2oPZydMbbVg
X-Received: by 2002:a05:6000:1885:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-49c727d1e47mr2139782f8f.31.1794530245167;
        Thu, 12 Nov 2026 16:37:25 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2702533f8f.44.2026.11.12.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:24 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:37:22 +0000
Message-ID: <20261113003722.3667081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-misty-lively-galago-693c57@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <20261015-misty-lively-galago-693c57@quoll>
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This is odd. Device is specific, fixed. It either is or is not
> compatible, not both.

Right, the next version drops the syscon compatible from crm2.

> Do not need '|' unless you need to preserve formatting.

Will fix.

> So the PHY does not need any resources from the parent? It gets its own
> clocks? See explanation of simple-mfd.

The next version has no PHY child nodes. The PHY registers are inside
topcrm, so topcrm itself gets #phy-cells.

> Incomplete example.

The next version turns topcrm into an MFD like Stefan's zx297520v3 CRM,
and I will make sure its example is complete.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word bindings.

Best regards,
Navid
