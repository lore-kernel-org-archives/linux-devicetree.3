Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262551;
	b=EQ8PEE3Pr4AQZj2m4mW6KnZynDzXNSLTsC2eBV7Mf+d6nqrUtMerrr1XOeYRBo9S2Z5n
	 gz7ifBbB9K6rQXFjJJC8dtRMyqD8tKIwjcJJ/h3+c2pT2PoKr3cQsfgG9IP0wCKT0J6hc
	 Mc955bngN7s8eNWyGdF1B67on91Et42OXrK06w0utQ2PtQ8VgbgV5aeK3IRDriEI59zYy
	 W5PosCUKpGMBEwyELv7ymHhfkWMaoWNaECsT3YAKjPjaOFGw8I3W5ZxLsfR4sDBVyWLsV
	 xuIpsPCaiE6kDF80iy8lLCweXx1JWYRbhTWFTl5T1tRYPmCAypuCmA9JHnmfZ2eXixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262551;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Gvt5jiBDiNulHHrYg+BrD7+VVcW2lBBx5OIqzR4giU=;
	b=TnOAFAfFzL19zPNLLdyE1j9HZ6VSpqKdnivea2N9R8SJFvLcafXFglsg311J7AL5iMeS
	 Ion2e3noy/lr247psnhQMFruWxrvOT+EzGHSApNXzQ4scNjpZh42WRud3Z3CW1MgDB23e
	 iqdyfrfMLXoXJbBTRUkOMoKoeHa+DwcEoQN7JA8hhtF7outfO5YhFtWAUscF1Ugq8uMxp
	 w7FYCP9gVjRqnSOinxbD/UfxZm1cGA019C6X+O6rbHHp9IbHjQ0GCHbd15NAIY4IoCZyM
	 DHxe/OUW6aJtJnOLYVJr/eARPLrB0C7X7DMTSWHUNVRVhJp6PvDXNCciElGiAsdTHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b="Ns/a5WEC";
	arc=none smtp.remote-ip=91.218.175.134
Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731F606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E731F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Ns/a5WEC
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DoO8s5WtZwpzyo9LpQKIECh6IieoqjmPFfrymZi3V9E=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262548; v=1; x=1794867348;
 b=Ns/a5WECT4Kr88Y80ZJcq0mFcHzmcOKiouEhxqo5Yh+qA+ShVGdQKmHgdTV9rOq4S0TjyYIW
 rX3ol7VoC5zVs1vLha+7+MiNk0niHoybjSSXI2/omGeZHxGfj9sl0kRhNr+YwEx4EZrf0BNpG7K
 y6a24ty6MZpSgkzFmd6X0Cy006AkXBkVHiyIgOBp9GFEiviPOt1B9AxC41Q2iLy2Ku9LC1YzUQl
 22TUVGI7/7pw3z4cxLrCjDBm9dFqiWaA0BQeYkJgGh9MEojRkdMDYATFaTne6cl0Bu5zhTYclAX
 fc9FdkluRofERZoKF7I44qJ5dvSJpOncRDJsWfq6KdpRQ==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 392b2637e9b1699c;
	Mon, 09 Nov 2026 22:15:47 +0000
X-Mizu-Trace-ID: 392b2637e9b1699c
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: pmi632: Add LCDB regulator node
Date: Mon,  9 Nov 2026 19:14:32 -0300
Message-ID: <20261109221453.658316-4-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Describe the LCD bias regulators provided by the PMI632. The ldo/ncp
nodes are left blank to let the device trees fill in the voltages.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index b0ed35094a98..ab850050eb22 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -204,5 +204,19 @@ pmi632_vib: vibrator@5700 {
 			reg = <0x5700>;
 			status = "disabled";
 		};
+
+		pmi632_lcdb: regulator@ec00 {
+			compatible = "qcom,pmi632-lcdb", "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x3 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pmi632_lcdb_ldo: ldo {
+			};
+
+			pmi632_lcdb_ncp: ncp {
+			};
+		};
 	};
 };
-- 
2.56.0

