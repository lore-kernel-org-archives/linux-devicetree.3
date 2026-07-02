Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA63E0C59;
	Thu,  2 Jul 2026 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035659; cv=none; b=oyrphFOvurDys2pYLGQWE6/N9Oy4VSjP8/4TWRcl1Mqp9HtEdPkcxu9ZZ68i6RV4racXX3f0hmzbY16C3HHJx/SNzhFFWNYspd0dqiAIfLq2JqW/5GUSOrxl+TodmjBXWqHJT4lOQvxh331TeYSwHzAmhJIMOXYxHk7OWWHQSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035659; c=relaxed/simple;
	bh=RxjKCnqHSH127b3+Wcwdi7xGwvw9JMNEO6UXod6LzLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNt4hIF7k4UTTrTnaE5yl1vkinuju5mGo5RETbEs39p88ztbTS9Gz3ytk9NGtSq3BucHy1agqzg+4Qj5Otc9BawqKik0tAnkY1qV6Ild2gRwARnSGJ2Tj08ZtQIjiiy2N+8vxeCjOQ8T6u498+OGCrDxpxnxhz5NMTJGeLRSpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0NVEaUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0NVEaUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE5A1F00A3D;
	Thu,  2 Jul 2026 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035658;
	bh=fz43CmYYRjc0R7a+YPdWdI/W97VUR0WP6b9kcqlDnSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F0NVEaUP8kjjm1wsQh+9lRVX8KpmMIQKs8LYKtzL2+sFXi7cZKKajDvFvyIM5sLtS
	 18f88g4l63bk8BvIaAvF1QuHd062TdKD9ffMe69Xw/C0NeyXpF7t2Yu5sK6VaoLlhk
	 EG0IY6qAIDu5PXAxMoO9KKH37anhuAt9G4/e0eUsJDyS6W+fjmcIL9A0/QLhG49GJk
	 QOQW5tTuhukzOMlzyfyXRNqrx0s2D0kTsqjohGIdSWR+pg+0NGZnFvO1BXi7BlbTqr
	 mzttTho288kQJ25ECKaWcDm4/U3vaPOdcugA2rvGyIkjq9s6ftnrAgSecp1J+HPK0e
	 es+C7xxrzNjOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom: sort compatibles alphabetically by base SoC
Date: Thu,  2 Jul 2026 18:40:32 -0500
Message-ID: <178303563647.359079.11020390620448704482.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
References: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jun 2026 16:02:02 +0530, Kathiravan Thirumoorthy wrote:
> The compatible entries in qcom.yaml were not in alphabetical order by
> their base SoC compatible string (the last const: qcom,* in each block),
> making the file harder to audit and maintain. Sort the entries for
> better maintenance.
> 
> No functional change; reordering only.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: arm: qcom: sort compatibles alphabetically by base SoC
      commit: ea2f58d9ebb0598611085a54528188d2322ae6fb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
