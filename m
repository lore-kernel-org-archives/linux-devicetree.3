Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9E37C936
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632563; cv=none; b=G86cMTOOEKqrc68zISoXpx3ZTqsC6L/ZPr6Oq2y0wC85cnfDaBaufuyTAo9kV0pcr689KNu/QazXtgM2nZzNZfho7YuRJdHMuHuszjRzi92G6aItNHwL1384vhnOYo69TDaYURrib/ocWdtoJ0NM3gg4dhPZViA6uOjgRycFtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632563; c=relaxed/simple;
	bh=cjQ6RYzc2Amucs+53IxcHHczFj1kbL1NRf7Hpsxfmg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGbaJc4rN+tbO9G9iyzXSjr5ncjtWLAvkw67xhU6mx0h+OGVAhhsRtlRk6c6QpkGv/q8uTN28n4B9S0H1naiFw+AZVNGefiiXfIPmiTBjgEGF4aONpg/8FR/g/eFSGqmfVIkwLaRx3irCFIkqjz23UAPZnD757xrii0G+oBy9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVuVJaJJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVuVJaJJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1344765e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789632560; x=1790237360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNDQvvdETqkQqr6M3U+s+GuEJjts7GdgrSSwohM6KmE=;
        b=iVuVJaJJbujO3c5XIHUBkcIUF60Dg90fOoR5t5RZFE6rFpNU7J9ze72C++C7Fze1lu
         czEGzL1etuAFkPVmgj6F3qnBNdtbdOkum7Q7nJYPKG6a+42ZN3yUN/cYqNsOUVQTRcvs
         ojuqxBKQBjz5nEa39AluoXFMKUQ/6lx6yjug/YoCZPFvfHUOk0ac2ds6w0BrLJr5/xHw
         euby7eAH9j2yEDITeXe+KjSMtYQl4OQf6OlEZh4l9evvki88sfHP0CtmEIvXjsF3xXhM
         nEopzxxIijx7s+gaoEPYOt4Sun//rhvo7QaAFxBZxm92eY7WU7mrYHQxmPQI492k5Uc4
         XMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632560; x=1790237360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNDQvvdETqkQqr6M3U+s+GuEJjts7GdgrSSwohM6KmE=;
        b=ZlT/ES4InMwgykZ77AA8IQRhul0bA6iRfbQJZB8AzA5gGBLVcnC3DhAkDXkderwm5X
         ucBRX3VXl/dnXe0LdOSuqsrEUXV0zSSVlBUdd8hS9AFpMPr4ZGHR7CdRp3v23Fshmy1U
         bIA24P7rDge6EfxM6xSxnd2sk/56bfM2toUkmAQeumvGvCMRKHKdzvp9sM/T7XxEzLE7
         tFqSv3zurENQYSZZbVDjGP8e3Ju14GpDuAqtTfCYObZ5YjFn9fg2i4rwSN+JJEuPtC/t
         B02NYRhDdiK6kH4LgvkG+7UymFve3TtwkiEUiZzogzhW6kpCvyRQPchgwN88aIN16Mj1
         qQGg==
X-Forwarded-Encrypted: i=1; AKwUvBzcqSNC4qegiyo5PYSZ68+Pc7VlYXscTTLgGcaZo7G9Rz4Gqs6C7o38hoy+omreXvhexEaEUEAQBl9D@vger.kernel.org
X-Gm-Message-State: AFuF++kFsRIjM8cob7WslJ9Ho4Z7cCKocUUc56O8dZT0LYjHHIPf1CSA
	VbIMv1f1eRr2itIN8J37NA8xtiAFhWbFB/FPtJrS8hYlWnH2k3G6wUAM
X-Gm-Gg: AYBFou2WgmJ8/mN7CEsdkiVfch3iPSSoBdt5WeTuu54NiOuzxMeGiPCgyMaFCf+BrtK
	F8JD3d7k9eMZRNvIgfCoyIHEhCWKCkKh+DJN+oJ0Ns4diIesacm/P0vIKAE5eOZtqMjGMEnY6fJ
	QE7ytoI289YBzj8CwIZhc9w4Tk1ffvN8tx8NG1PN8BwLIScIk036m4RnnWkb65OQAzBnfgK0cfr
	btN++dNb3uawydoEuQsKmgJWDhIQpSI/IVS8D5CXFjgDUETUTe+hRnx98Gog/+XsvEJYnciTVJs
	AVoBdHEqKTH2bDLWhAO1Dms4veYav3Vd04dtBsAvE5VSMUlNlF1cEXj3I0znlEotOXMksw8k8Be
	ZE6mj7iC83afqFrXENkcQiSDrEfXLs4/DjEIsBn+nNP6W4P1KhJfvkoCYYbOcqDECTBUlQoTnjK
	tgwhmD+vAj+kMFsR0BZgEF1aMEjxnJMnzzbGOIOIw33APMGxYY8X2zwGHBxHO0Yl94/O+g
X-Received: by 2002:a05:600c:1d25:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49fbd1ccc32mr42120145e9.8.1789632560321;
        Thu, 17 Sep 2026 01:09:20 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm85566375e9.3.2026.09.17.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:09:19 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: accel: add adi,adis16203 support
Date: Thu, 17 Sep 2026 11:09:05 +0300
Message-ID: <20260917080905.7654-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add adi,adis16203 support to adi,adis16201.yaml for
staging adis16203 driver

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..73ea8f192 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.55.0

