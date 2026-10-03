Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CC49EC67
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050230; cv=none; b=A8fTJjlCjT4U+hzQKpbdKIDAPZTxB/GWae0UnLnN2nl6MyspKIH9A1HGhBYRaoylSQKDjJ7yp9WyHoepnU6/glcFqIzc5cUknp9cw8qQynjh2dyyrfUAgrcB4MxUFWfABX08BZd9c4JrQ1GcWWMjscb0iOcZG2bzLyfHThe/YQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050230; c=relaxed/simple;
	bh=E3tyehOB9W9Nl5Yzv6CfUNAfqt/mgkcRmqeKsC2PjQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y46gYDRpkWjlpJMXBR92sVODCYxQxfBaav1qGoUDI9NS269iqLdaNeX3qUbSTWdOkgzAoVt4dGBkrI6ijk1jey3GUsr1tMZoeyN7VJqgIT7wwORemKV/Qxv8r4zQzAMOxykCqH8FMhlgWmUwUwJCj907A+aVa/5rECmLagHE91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEZGQzCT; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEZGQzCT"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e55db58cfso50311285a.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050227; x=1791655027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=kEZGQzCTESpYFJNvGfSXIZ/wqWtxmC/VgLMeAN4s9F2TQIEacrwlkc1rxANW3aU7W7
         bcO5wEz74ImnfjtCOhlElEy9QDyATLOP0H4YR3cUSz1zaCx3nnEcT9WALApMfvE2XevM
         6Zqe3bX1ogA0ppM1s0FkpwT7R4KHoTN1zCSewGrtGBuPK/1OCl13zgus3brDiiY7Duct
         koNLDlmbk6idk2lGnXol8gIKuDxdbb9347pQx3KWowt3WmKtOUVhUCn5WHnIisp3z5th
         L9CTKhvliu4CF3FY8XFnDX+PNkWA/eQJ/I73RZgQ+u144RiVa150qjrtV8Sv1Tt0TZ1m
         q7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050227; x=1791655027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=Ka2a01r22jhqONZo/Zim1BRhBoe7RzOhBva/ZDrlLu8ToAB3qz9juB/H8LNeFvJoIh
         fRa2x7HerLnKPXk7+tczLdIw27ig0qu9F+9cftTjJaV77ML8OcQYq185QtGlI4eCJGpb
         x8YZy1ClA/OyEnvb5Z/MGD9C4D4zqEiLu6dWBo7vmhPWcA5SwW5PFaBPAm6B2jTHS6fX
         zuBfalGUk7wE+9lo6gGW1XpBJchYUgD/mQqEJx+St7jWwIoNIG/zfzZIBWm4KM1dASF5
         0iNtkGlN52xajzqaJjpl+YW82bZVqJu/8tn1JKDLR0JQ892I8FzqKvS2gY4Jel0fYE3r
         4MCg==
X-Forwarded-Encrypted: i=1; AKwUvBx3PjEi+4+VgtE50jECTqVnkUsq99kVFhBQeKKGcARAgoRRQsF0saKn7yH5fydsHCvqks5lqxvnzlrO@vger.kernel.org
X-Gm-Message-State: AFuF++mvnq/H8wZnVI7TTm1p0nCArdmnKRiB9zqcnzc86yIPHipY8BJc
	3wGXJtDFbnflNPvOdZFyJAgBRKe+pxyxbDPw7fMIod8+bAZseBmRip2a
X-Gm-Gg: AYBFou0T3+9kDCmrr1nbz1xxRZrF8Guf6d208TS5GpQ92AyDJNjAsOZf/OgIWsXe+qj
	eabkpPWpHp4hOFugS7QZm+seILBfEs8K7tjONTnqHkIWtmebnMv9q5Q4h4QEPlb/ZJLG+jGh3Of
	j18m5Qo6czFHqY9eaHhEc9fj3w3ni1LUxIoWCSmldi6785EjhOUOnNlUenyo9qhwe7q0xBxhHEo
	+EQtum636vcjmNibgyqsMJ32LgcoWYH6iqD9unnUDa7g8O32KiPtmEs9VTkmAAM+hAbE5IZM+lS
	CyQpMDeNvLevahQFQefkQb6Ot77yjdcK7AsX/j+CrPTZaVBpat935d8ALUubl+nqVt6gnBf7ql1
	tpp340sbFsHUV+n/cgKtT9E8O+8Wd4PeiuXvCtPxgrnVYSf0xnnCwBRAKzLv3Z+Tdev6+EEgZ2+
	pgEMeEpGz9BXZBZZx2JnUpAV7TuYXDIyR1HRFpaLn6xOplVhpAwOXUuC18fEFWPuoAgKex3RVhS
	Q==
X-Received: by 2002:a05:620a:28c6:b0:939:13a7:70f0 with SMTP id af79cd13be357-93e50e08351mr557059385a.5.1791050227622;
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e5b8c55sm283382485a.16.2026.10.03.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Sat,  3 Oct 2026 13:56:51 -0400
Message-ID: <20261003175659.23536-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

