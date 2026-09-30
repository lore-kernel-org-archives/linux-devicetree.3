Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513140BCC8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753104; cv=none; b=fGc63ZdCUQOJ/6VSUSUbKzP2BCcstCr01dvFkQ0jCvg78b5z5BUH+Q+ODQkR2U6cjCNzkf+lNeBN+YRmDO3h3M5b48g50HRQzRGWN+2Ve1UnMNsCR/yZIN2tHQnBotJfkEXriaNXnno2bH6cfUCbZADioV64mkVuMs8QfkupOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753104; c=relaxed/simple;
	bh=3nG/sDKEXby/WIrLfH86wORGS+f2incixoM/JnZ1iJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQFkDcNikiXo2PSgeawU7UseZDUx0zVs5GanaRwpo07XzD4jvgVfvjAwTW9ZlxvLo0NRtyAvKYuM9bKilELTeRwTWRsMc86iNYWdJsLYCd73dCba8J9bG1CUFXXrHiHq44sNkpUb3MkH+x7bLCVDaw3zsm/y1WgXWp6MDzaVDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inAmJie9; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inAmJie9"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso2842597f8f.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753100; x=1791357900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAd6nfAO22oQbqKamKmwvUK9RC63ufUS5aB+67o1X1Q=;
        b=inAmJie9Vl9FlWO2TXS8afcevZQYRiCqQ2D1blJ3gQRcwjecBwmKmScYrPtZVPK+xy
         F9sAbwXUtk0oHtn+UzCLXDi8RYpRt3Hm4hCthH5jVFi8CDeU/YogY3t2U+JfWz6DCP7n
         /Jwo92Cdmgr1caNq0Txieb5/1FT3jdTCB5jgNe3iTmsF3MleVLyqeY9kg1lkHmkI29Tt
         sA0N0QGpNxSLz2ZAD9omxq5Z7BDga+3jnDt3zvfKpW7qilFs5qv8Btpo0hxd4buAi/uA
         gkpop/yH754SAZ9Q4jspnDMcSS+vndFfhaZ9xh4+Ix+oeu3DGlC/fiE7B8EkjZVm//eU
         t1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753100; x=1791357900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAd6nfAO22oQbqKamKmwvUK9RC63ufUS5aB+67o1X1Q=;
        b=wl43tjhY+Rn8NMgP+npHVp/IFvzIC5KG4uEl+sMFI8FIgw1OvfdAi1VgaYxrrwUVET
         dWLvc00luVRSvNhBEMk5GKWhU+iCoaRyVDIwe/koUpTMYkHp+bGNKK/hxslgz3eyJKWZ
         SvAJxLom3n2Ux56O023/0wc9Z82zFOSgvPT8OAmmq/l4Jnxr8Kz7OInLoUFXehO+xgac
         lPU3mWyuapPe7XJOrlc49PR4NA84Q1aCFYtOZjjujMFV8t2QLLoeUPfJNOz1UPdrcg1S
         af3fpd57vphAQTgFIo3TWlvmqzIBVS2x4wzusOHTUY32Ytr2H0zP3NvGrthcUgWFkdmo
         o6VA==
X-Forwarded-Encrypted: i=1; AKwUvBySpqawz6PBF/jPwz0y/kM0WyMHGut/PMIrt2S5bh3g4EbtMygubC2BJ2X6uBnlitf+oYT8Ow+y4Q8D@vger.kernel.org
X-Gm-Message-State: AFq9FYLQnYY1IgyPMM7Jk8a/06MWagqLr3VtYtPBqJdRF0MroB7XCbQK
	BVcym+DoJ58E9Rbb2PtVuVTO3iHMxUC2VUXx78zvuIhpFyhA6vrwfSul
X-Gm-Gg: AYBFou2Qhp1AMIojWNqt1k50nM5wqVmApDmD6K62LCL8GbtCOxUaUqsjlbRWr9rdKMr
	ZSYZtpY+FWyovtR7I+TsHezvSb799+UZ8trRX7wBSxnoMa2gsywKlECV9vvVsIQl0LIPbHN1YM2
	a6fLC8dTbEqYIKH/g8i39AApDNqZzNynmz3FA0S/K9RNXDO/WvrYHvViXqL4bESWtcNjH0ZjANB
	GmUAMIDfV/mEZJRPMFb/sAEfaTLhzeDu3mAXw0sS0NlAW770ggh0HGGPaYAUjLuLNReC0gwEHFt
	nsIn8Jz8uMZ4cj0Ev+EHtM+T/VZtKev/FN8CgSrUN/YkrTHenKbRjPc/52P2H0BCSBVdkj4G9ai
	v+P68hd55uxIEldKyUeT1vEy070MDltz04KQC+OTmojI6Xfkk6TiBx/fo+u3CQQfP9BROOtNcWP
	/tgHbk7J9RjmuV3HJkDU4MJ2O0tMJFR77jRiEorcNl5S8JmWkwtlPWcGeGnUKCvuTszWdTUKo6/
	wHrZsmeS0dZa5IMFl8=
X-Received: by 2002:a05:6000:400f:b0:48a:f26d:18b3 with SMTP id ffacd0b85a97d-48b02535074mr1142441f8f.42.1790753100479;
        Wed, 30 Sep 2026 00:25:00 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029fc420sm1267411f8f.28.2026.09.30.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:24:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: power: supply: maxim,max8903: Document MAX8922L and RT9524
Date: Wed, 30 Sep 2026 10:24:49 +0300
Message-ID: <20260930072450.61836-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MAX8922L and RT9524, which use a similar charging control pattern
to the MAX8903. The MAX8903 is set as a fallback for both chips. No driver
changes are required.

Svyatoslav Ryhel (1):
  dt-bindings: power: supply: maxim,max8903: Document MAX8922L and
    RT9524

 .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.53.0

