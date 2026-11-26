Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.204.237.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664345;
	b=bsxdueGxIyjfZ+mdTkCf7rAX3hDM62H832K8YN0m8Z7hhQLELY4Hxktpo5hLlWq1H7lP
	 do62FeU6u6cy6CcMYytqLMUF5P6OP4zDLDML7gSllcIIdo3SX5djrBhnSB9dbw0XcHpqo
	 kEr2SsGENk34YdBYmeIw1NO+C4ujcSo7zbmfUNIaaIQzR5RSI/2uniK8j3qwONEKlhwNH
	 vU8zmOc7wgz19KJ+pJr4+elqGeqknLn9JEpFzE/tbioXiF0hS+dJTe/oHgp11Hn0CcQNb
	 XWYwm3mmyFYeGQjTQkQ28txTymNds52Y2q6yPPRTYDwlxU8Nls14GOuJVdcEfxhV+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664345;
	h=DMARC-Filter:X-MailGates:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0FgtUwX/QDpFjEdtf0ENnKLphQXReRL+nipzTS3d7jo=;
	b=md7AozxbIn2ga12EBue9AvM5/ALc8NEeU9xzeVdkLi2wGiquHg+9/bNU7VVGIlK4Itfx
	 KWduJqoj0J6OJNt7omIqfcnysjrU3z2VjkYTk5S/FSFcDq1XKtaELD48iMb3+DuI3KlF5
	 mYXPNqqxQPr+rZOVVeSA+vX+EKaO7B5MlnH2uDDXcsOOoFI6YYuzo5pQNxc07PZ2JkYbS
	 AEEMR6SQN1jpYSdFnb+luUZtD2dD1bMD6yVmaFw+SOf34pfh2/V1D76DR+FWUhIpmqb9b
	 tb2ZcyzH1DHlRMmY5n7JNqUgsj+efwecm1q8eqwpKGmFDdhCE2wQB0zqyt4yF7Kq45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cqplus1.com;
	spf=fail smtp.mailfrom=cqplus1.com;
	arc=none smtp.remote-ip=113.204.237.243
Received: from mailgates (unknown [113.204.237.243])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A5B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cqplus1.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cqplus1.com
X-MailGates: JQAAAAAAAAAAIR1gDiFMAlBpD30cVA4IPXtBfgRofCE4cS8DQBFyFHM3EQh
	e
Received: from 172.28.114.216
	by mailgates with MailGates ESMTP Server V6.0(3855469:0:AUTH_RELAY)
	(envelope-from <qinjian@cqplus1.com>); Thu, 26 Nov 2026 11:38:35 +0800 (CST)
From: Qin Jian <qinjian@cqplus1.com>
To: ag@ffroot.co.za
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	qinjian@cqplus1.com,
	robh@kernel.org
Subject: Re: [PATCH v5 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 26 Nov 2026 11:28:51 +0800
Message-ID: <20261126032851.39306-1-qinjian@cqplus1.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260924164922.117236-4-ag@ffroot.co.za>
References: <20260924164922.117236-4-ag@ffroot.co.za>
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


Acked-by: Qin Jian <qinjian@cqplus1.com>
