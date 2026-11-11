Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427442;
	b=lMGz6NsZ8QbhOJkAnSeT/Avf7C8C8LhYf9S/sSeALIjL1b73kNjszUkS+k8QoSMddtMc
	 gv1VHgShoekO4QznAQorFpsRKX9iHEExFIfejADp4NZMLcAcpc3ffw+VmszJQ/8RUGKpN
	 L0UAnxP0pMwfFt0P2nUjCgPSoUuHRJj+RRU5AD9YcndfyMhI4dS19QzYN4PIoGMalX8fz
	 dkwxwZjlLxaCfmAIjES+0XX5n84gefoubpbl+dcHKHxQRMxaiCrN0Uqsl1ZIYbr5IW3yD
	 5sReuwwBzKEGl7l+w7HMbzrcZxg0Vwncz90P3jHKmW8UI6NgWxEpJ4UbjdJmrPuYwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
	b=W4/VcPrkfcUP+c+CG8sF/eH2kWqFRpJ2NITg5f175UYmzIG7T/vEtLZT/L//Glzcadvu
	 zOE1cXAODC6nP448P83AXAJTiThu7qrg+LFEKgWPgWPdU8UA/GOS59koduZKv61Jh68lk
	 jtw5399ivKNgjVzUC42/oR8XpN+0VJ3c+jbmYdR9uJWLcfbF8px/zI88F4wPwdWni7j/2
	 uIfLl5av963JMDzA8TU8ylf0pEy3MHCs6FkFXnJIdZxQmZZQm31aXZEjapPrebSbFnDMj
	 7/1rF8GJQaAz2WJOqqAqYNdg2RCJ1SM+46FKSJCYrbpvMWgTcGwYPBxAeP0odz98Hug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE497606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE497606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3704d30b84fso4503283eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427441; x=1795032241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=zugu79aaBztU/JB/0/i/jqbfCJ7mv+7un6V296+ptLLqHjoNzbL3712fxicZrxzNYb
         jgPTQI8yspdrNlDBFW45xKAx5v3ZcLoHeRd0G28/uvmaJ+FQI9Q/V0Cl/XWYW55Pe/qA
         afLrPj26oqRcsF2gNknTXCB90H1+WLbqscEN86OtcU2/YnEO7yfVsmf8HvTSc5hVzHv5
         OVSD7pigMcFSmYKNwtl0sAsfU5pgaAhHoNnM5/F2u5RkZzVpHHWgYIcRuzn7dZypJKqh
         zP+yFTaW2vvUunbj4av6KC8J8lVtgNa3lRab2dWtVtqB2n3ct+S4raNrjcb28lSCdYEA
         pmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427441; x=1795032241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=gB6+TY7UgzjxMjPkvwKzw2PQAsXppcDPdpMyFC4WkVoFH9z59MJlIHE2qMOJi6NmTQ
         +Fzlsxdm3iMEXfhyfVIwsZjO1hRzI/b/LCXm/p51xLkNS32JziegA4E4rNAhWNflJdKM
         As1S/DdpvK8NTZitrDSTvtIkLUA0xXGCZ03jMgcsGmhnV4lYD2rrf4sYbVhbLgwEeUtw
         pBXXq7XBRUEKM3f853TNfWVWxGrLqDCke2WPyOxwsFue21lhWtWIViDAh48cSeAi000P
         qpB+fC1ZdGlFzboNhl3BMd0oU9fu4ykLKihCNDoC8N7fe8F1T17auXqHjBHg5hndV6/w
         MKTw==
X-Forwarded-Encrypted: i=1; AL+hErFxTvg0gaszceABfQpRG0K/RdHa42MSAramjOkGdHKT7KNz046WhGelC3YZBQR6O7sgwaaMQMLOVwcj@vger.kernel.org
X-Gm-Message-State: APuU4Z/SO7LQE+lGwScp9A2KKzNyWmWVwlQSLrrZvk26YXJMhXqYmfM/
	7H7mSTPRr6SNzXh4ILmqdqdkpTLBQAPhisApLnd+tWXejaIMNGWVrpnK
X-Gm-Gg: AYBFou2TCrSYCKHpYLmvMp4bPLq0fuDXkwN8lWjBwvE7v4FXLwgSeLa/Q2mbZoMJ5+H
	PIz2gbY182VjytWW1aWsQbir43QF2e53pPb4dLxM7tOJNqgYk8c+iUPQUsal7nOejTdAJJuLiPY
	oGBUJDUGUNfW8y03JiZ1J1R/D1tphwtWJ6QsfudkGO3P3g8e3uXbUDGGP6AxST3PVE4hYrIgF2M
	2+0Ix4I6FO+TYtCIoJXg89VlZqfV06wL0qPFkg3rdD0jJjZfGj0Q99ar2/hRF+9jlF7BLipAus6
	nGa5rxOYGvAwP2HuAya5M28p8fuBQeffATNZyWHRia0PIB6qQAkCaWRWFSJg5rUFNXhT48KbtTv
	agKYErobQMXm0UbwpKh4hG1UKlki4N/ZsCRQnRgw2Wx10XGuOJxc8rtasL4NDEwVkUIRksxHsa6
	vry2mA5z5f+rLNG4XHyERqTziBCK7SsypzUpbZTI6M35XQqzLTmWI/2NDeAHK3C4yrcRU2Ruheb
	nYQDlNsI8FyhcrL7m4WLJN6l+kIByIyEMNR76aUPkjiDQsEdoVXFUPAaUhPglZJqC771AnuJr6U
	Y/MD45HcsSf+5Jq8tnJhIkhScc2tnyA=
X-Received: by 2002:a05:7300:bf91:b0:372:fa14:8b6c with SMTP id 5a478bee46e88-37685d7532amr4114764eec.19.1794427441021;
        Wed, 11 Nov 2026 12:04:01 -0800 (PST)
Received: from debian.lan ([121.101.132.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm20104476eec.25.2026.11.11.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:04:00 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
Date: Thu, 12 Nov 2026 03:03:49 +0700
Message-ID: <20261111200349.6588-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
References: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
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

On 2026-11-07 19:26, Barnabas Czeman wrote:
> You should not override rpm_request node here, you can use the labels
> from the common to change the ranges like:
> &pm6125_s7 {
>     regulator-min-microvolt = <1280000>;
>     regulator-max-microvolt = <2080000>;
> };
> [...]
> Please add the missing regulators.

Hi Barnabas,

Thanks, understood. In v4 the common dtsi will define all the PM6125
regulators with their labels, and lemon and citrus will only change
the ranges that differ through those labels, without overriding
rpm_requests. I assume that by the missing regulators you mean the
ones that lemon.dts still defines (s7, l5, l7, l11, l17, l18, l22 and
l24). Is that right?

About your previous mail: thanks for the dumps. In v4 I will move the
ADSP and GPU carve-outs to the common dtsi with the values from your
MIUI dump (ADSP 0x53800000/0x2200000, GPU 0x55a15000/0x2000), as a
separate patch from the pure split, so it can be reviewed on its own.
It changes lemon's compiled DT: the ADSP region shrinks by 4 MiB and
the GPU region moves away from 0xfa400000.

I can only test citrus. Would you, or Adam, be able to test the lemon
patches in v4? A Tested-by would help a lot.

Sashiko points out that WiFi bypasses the wcn3950-pmu regulators.
WiFi works on citrus as is, but I will route its supplies through
vreg_pmu_xo/rf/ch0 like qrb2210-rb1 does and test it before v4.

Thanks,
Amir
