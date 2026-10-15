Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639156E074
	for <Devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088588; cv=none; b=XgkhRvCsYp7Hi0hTxq55uaRvdFh+2KlvHLtpAQYDqIi58FPSFOz3f782a5UZISOVvvbhSrvK7MB2FKF6ugZXbUicLdx63w2zGAbvOW5d+ARFG0PXOgHAB5x/J8gxOo4Xj7Mlg0LPxJ9snHMMJ0At2+hdJbc2B9//SjoSIfK/DeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088588; c=relaxed/simple;
	bh=141w4atlYroacLxgjGyINyQC13zsX0zf7Nm5/ty9B/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3mueLp/MWbqGeBj121qE1jjERFIpFn5aX3ORaT/A/uJXyRYysfDfUWi+iUw6xZK4fagoMBMNo6JyEyPHIECp+YcFuGQuCK8pf+QxmLWkSN4EWbRIhnBJJiU/a10cJqNSxtzDiHwvQpr9YMspS82ScsdFK0tw6IsHWgUq7oeIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNanEG8K; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNanEG8K"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so3468971c88.0
        for <Devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088584; x=1792693384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=BNanEG8KIjUIiGEUJJpgAK2k2a5L58o1DTXmAgYCdV7+MuNTpiMbYyGX1B6H1pIVMs
         W4QP4t2guX5bFp2PKC+eszz+0nPXE/DIIqdZkWmbxfwlUOdp22id3TMeucsz8+ASHDpc
         vUen6CPlJ96MeL0j5uOCiWFt3ztwLgQOXCnOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088584; x=1792693384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=pcSimTbmTvtgoMDljDpWX3uhImDyLMwlae5EjpqaiM1O64PHF54spBvU463ZioLFsv
         HCIE3jvsZloC+S5ptapYe5NC1XuoXVxLSRbn0Wm2hVP8YC/j/hgcBQJ2rKZUcuSWoyAf
         YExkMXpA3C56V0YQM9qcSOutk5NvcEuLdzHSI0gfspe7NIwhp4nQ9IRvZg8fmK9BCfMX
         clODBkDTrYavR+Vx3SBxtSjzCNl/niVjIHpw5zjHQ4U1AvzvAeqX+2B/Ulbcsyhtg0lj
         bvzLH0i2VZWySQiiuIFg/vqGxRIe5dSZENBoEL6RC9QD8CW2D+xwvN4XKDJ8Nud+G3E5
         m/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCE/96E4q2r2oVJh0zR5aKqTXvKO2oH/3fTrXdik9iYYKBMXj64vkHmzPLOxZEArNOto827xg+7Tik@vger.kernel.org
X-Gm-Message-State: AFq9FYLSdI18SWovFt6N2QGuX0TwyCKqCNGdPRWQDD87KCz0HxGl/vEg
	9V79GDyhfmAYnCG+AwQJT1i3JKTXx3+PIhyj/wiq6ywyGaFsT6Ot/Fb1JfAMs2RuSg==
X-Gm-Gg: AYBFou1ATleTNyD4xyWKlJp/EcMIWp3g39nJSqZIo+pCkw5UVimugEy5+ObFwcZGwBG
	wpdg1GGPTXvaBDTs+Lm5w5nKo5dSIEhHGOmNB2vv+IDr52dAXS0Z7whOuVbOTAEXdAWQeWJlb/5
	CFoSomlDqJBliENSmQp1PUlOWOrQLgIh8ZF0wqvcc0TxjonVs6WWAoP3J+BhldYSrQRECkk5jwi
	27HW6Ke54gZBoIydMyHiHEwqNPXftDDW9Wg+61E87fvw6mZ2nce9+hmquIT5olyd8s1IgPk9eI7
	4SMWZGvbGk1Bm7XKY0JyQA4ZvEPTQDzPcaIsfbJqeEmYM03n2bXuMx8x+1EMC9kEV9NmVvwxK8r
	1kRxH6tg7mUe3DaMRDh+afgSxbfQDAbici9YV6ar7CljpLBOch4NLgCN9Lvz/+jcm4kpiX3C03+
	/ekPBVThfs3PMkqShV6Gg1uTzvISTxff2DS4roDGvedhWXSuZqmrCcbX7S2X1KIWpPAITk7eEIZ
	055DzxAR9Vj+aHR3JDIdRBXIWZH0HkA25iL91r3VqWoZ4Oqf28XLmAc8Whv
X-Received: by 2002:a05:7022:b0c8:b0:147:a685:912d with SMTP id a92af1059eb24-16a60811e7amr22989727c88.29.1792088584004;
        Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/4] tests: Fix Python test environment setup in meson.build
Date: Thu, 15 Oct 2026 11:21:34 -0700
Message-ID: <20261015182221.2931742-2-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb21febfdd3 ("meson: port python bindings to build natively via
meson and meson-python") moved the generated `libfdt.py` and `_libfdt`
extension module into `<build_root>/pylibfdt`, leaving
`<source_root>/pylibfdt` with only the source files.

`tests/meson.build` was still setting `PYTHONPATH` to
`meson.project_source_root() / 'pylibfdt'`, which only went unnoticed
because `tests/pylibfdt_tests.py` manually inserts `../pylibfdt` into
`sys.path`. It also checked `if not py.found()` instead of
`if not pylibfdt_enabled` when setting `NO_PYTHON`.

Update `tests/meson.build` to check `pylibfdt_enabled` and set
`PYTHONPATH` to `meson.project_build_root() / 'pylibfdt'` so Python
tools invoked by `run_tests.sh` can import `libfdt` directly.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 tests/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index c6ac2d7f8ec4..c25500606059 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -114,12 +114,12 @@ endforeach
 run_tests = find_program('run_tests.sh')
 
 env = []
-if not py.found()
+if not pylibfdt_enabled
   env += 'NO_PYTHON=1'
 else
   env += [
     'PYTHON=' + py.full_path(),
-    'PYTHONPATH=' + meson.project_source_root() / 'pylibfdt',
+    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt',
     'NO_PYTHON=0',
   ]
 endif
-- 
2.56.0.176.g3575e65682-goog

