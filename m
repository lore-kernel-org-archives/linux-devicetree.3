Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68227FD74;
	Fri, 24 Apr 2026 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777016508; cv=none; b=tD+Qb+KeIypsJF22KpijhOQcedgCtajUZjsCMsfrBNKNhyksDGubsdhvTELeyvByZA+XyvT0QDQR9D5DHbscKVumG7Csnno1Va20TG3bs92pfSCu71Ly0aEs1MWsdCiLXGwi8JxiVq4CsZQVlZCLS3gY0RyrqXtgljaDpelBrsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777016508; c=relaxed/simple;
	bh=QN7KVGFo1BBaETCje+vuDDb7jfacPCDEHCKeQNll9dw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A2RR2S8JkxmpWoABKhcm/TUBMZxHMKx++55FNSBf1npsbCeslCq/Oshyfc5Yac5Km2r2V6Q3SaxAzGQT8tqCqj7gtM1SZScQN8KdNyLxfszV3a2hbSG05gThRIFrZ4zpDG7UGaf+Px1BCFh4QYCUW6QBNlPh0tFuvMOI5nBRsCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=N7dNr0GT; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="N7dNr0GT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777016474;
	bh=PyZmHuWfKfnxFQXFKX9eFlxb2Dgp9LXI++/EQXWEc0o=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=N7dNr0GTeBYGuAJVwlLXrrc5qB6R668qCsngUoPvDtAju0e34mX5+atctbZJHQXCp
	 1kyS8PTYMxJjOVf8II9t4j0Q3pJbTi2GRf7Gd7XMdL6zVm0+YzkY542dUueIp69D27
	 T9khJMtQK28wrPbMQrML6pdjGqo+7CmIckT9gbWQ=
X-QQ-mid: esmtpsz17t1777016471tb355b527
X-QQ-Originating-IP: I3YscDtf5R4mtzw4gOyfBpObXsnW5epaXi8nhYV/Te0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 15:41:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11335633746206723623
EX-QQ-RecipientCnt: 18
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 15:41:08 +0800
Message-Id: <DI17RJXO783M.HVG11THU3E9T@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen" <cyy@cyyself.name>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NpzNf8JHXbEI/OxfmaUgVALc9nQiYaoolaOMBFjVIceqRDaqyQsBJwuT
	9LeUsohyECSKzDFj9EPczKjVgzeDsDjlZkh64TybvRW/WQZ63yZN+Bi/kCh30h00C3C1BgD
	BVjSikJ6PIBeTVOcFsHoX/dgNIRYE0Ruqn/tMjgAkDj4JHzNj17Dg+YEK4+6OXf1u1wZf3w
	ihz5KMg8xVEpLcBJBUDQ3Z3L9b89uhWEZF34QxQ16ZJzMWP0braowNpxN0PNeyrQ4NapnRU
	RNlSEzzqBWnTQjnUFN0m23gP92ISL+wW+WxLN1c/+LQlZLVork4NAl6wgiGzn15VlY1okOC
	dilH/uQqZBFpFt6OgPMCs5gwbqDWael3Nphok2sR7ZHNHBT4BGt2ug6dBd5ou9z3E/AVJUs
	/CHb5+nn/SCJ3c3OUfiQokPK0zMcPIBUGWJq1c6+9D9dcgFaNnqHAeW8UyWVnF8O15B+4s+
	5LL36UJ5bZ9y3LfC1wgWEvsG2xcFdq36VyzS+i9bbnMRdspSoIlMlabSKvqbl3Fa4LbSFWl
	yQuRxqB9p5hC6RldS3xuQ3vjmR904+hx9cZtGyM7TGTduzaAQylcSOlA3uJDfzG+8ROFEsx
	SlB/faW7rk5W6V8dph8K9+zGP9kjLksKqjHgxfRkUPwYtswEuzVbAYeBbge+i4X5HN67SXK
	BqzejYBvjqBWnuyL7k8DAGEGH44eaLTMUew19Kc06t7Mc9P75Ytkon/VgkD2/792E0aSbVV
	gj4cH4xO2KLnrIbbiMvM/FJiKrY/TR69Ch8dyodn7N2QkPnIYUnKD5JJwlIHl3/RSUjfqow
	DJ6zczVYWTKKbOGCIZwI6qiFAcjbNu0l4Gs6Qfnp6+9CcXg3vtsUf+5IiN/0S+Sv0XCBvAe
	9aM9sw+bG/Lvc4+pyZd40Z8u6m4HJ6dx2LQARGXNlDIT3o/FwQa5As0HXkmqUHYW4XKdwug
	YDCcEdHfrjaQU9F9eQg2NND3bu1IzfaRZyk2ygvpBJXrwYv/kQAkLz79S63pmxr7ASFgsHX
	ThV87cRWqgRQtSKqUXHy53jZDQCxvulhuccmZUr1VjsV4uBZt6WCCdAgIbFh4=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Tue Apr 21, 2026 at 2:40 PM CST, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
>
> The series is rebased on next-20260420.
>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
