Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD342DF13B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250876; cv=none; b=T8fwN8UHVfX3X5w9UUQqKq6mA92JBCJ11+EKxiiNk+nMFZs++aDnoIxtA3zGp//bM0IjdUqhFkBqtmx0Ga6XHA3pSdtJkD7Soguh1GqiraJVbQzBt6DjVR12M5EwGZbK7deSPUVxhcXdIP827/B4ND029HJf7JES5jEOgCe4pKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250876; c=relaxed/simple;
	bh=hsCwsgdCEMu4ncQekySiE2CRmPl3gfKT0FoyFFRUY50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CugAsXqwRNYqGkvQ4fGCQ2/Q/2vSN9elFFJhxoY3vpqYWjD4BOfjpUvT0L4yuymG5CHutSthn3ReqrLKRhM14tG1RmYiPkOHSQukneYaRbmOyMOHsKoAkYGKmB+LVxKtuT6NKrLhSj58t+x0Xzo3LxpTbGlstS5/TOGin9RCzgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOfkDqOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvGmJSr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOfkDqOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvGmJSr8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BnMi2451184
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SG8dIIDcbbI8TB/iE9tNqMJF
	NzNGx6dH9C/5q9QW9wg=; b=UOfkDqOcaZ0oc4TTRVjtyPSqXyKQ9pxbBfeNLo/3
	pU/77yU58mB7I8eod+UML1CjMW7VAtVOtHxO4KkA6JQBlRLq3B7c1xwwPQokg+xh
	2OMHZ67TqD0RZirVuBl4OLhotjdMHATTJalbF+AXeqaGlFHOP+su8EB/iYIBj1Uc
	vz1Wqsz0L372ZHq7jmxnstVjaIopig272+OU1AtWbdY2nVLjwGUG5V7rDBJY3Ct8
	ESl5ufJPdlk4l5MdfS1nU/nIQIv+rz1FdGezESLOGKjgyLeF7sk3MYtdOLzAowu+
	bmpi3Rbq6CBYFKoi3wYxR2JluDauNHFEUqZb2ZEQ8cwtjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjddu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:54:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51776d4355cso40229531cf.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250874; x=1781855674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SG8dIIDcbbI8TB/iE9tNqMJFNzNGx6dH9C/5q9QW9wg=;
        b=PvGmJSr86T/90dpkVJv7x5PIqDhbEuirmCMwjDyuoEZ7XyZWzKoaU+uMhRp+PY/kQs
         FNpWui5i7NMmZ57aib0ElTevTFw7WI/ZSn01ImAR36WdqzgafeK53Bh1RQv5HtwbxUyU
         NWAkuU+oEvA0hZwjdVu3ODdqjk5KMLgpu2dodsCzaI7rTfzv5gPVUMaXUfv/vhU7iK4Q
         2IjKXyYwvrgybdYM9dI4+shsjtIqypIHpLYVIK94BZR4azAGB6g2JZdMr+D+R/uh0C/r
         MZjnBRkPHPMvEGK8cqQZCxVmg5vvoWkC3NjJeiA9fYiuMRF9CdRK4aYb2jDiszoeHCNg
         xtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250874; x=1781855674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG8dIIDcbbI8TB/iE9tNqMJFNzNGx6dH9C/5q9QW9wg=;
        b=MMiVAowZmQw494jFp4eLruJIX6Z5G5b7WhsXcbrLq1+7XO5mg5EM9CQ/Oevf7GkRfi
         64f6vS8ABM2N1C0pTXrRjllSkgxLK67WZe/jxAixJeFIKs9XQImzfhVfEoeshsn/ayav
         RGFGlY3WTEg8R7Qd8knXUZFyr07isbUjygFdZBGFA6dvZUC/MW1eYr3IH+jqqC9yirla
         Q+Mse17FY6OtbOIjc36BGbiD1gQ4WXkD6V/PQtE+Fv7t00g/BocIh3AdMSFHi8kpBM3P
         iT7kl80Ev2qB3/ZJgo84BKsEVFXFO6koJMlj/RKMGLNqCLytHLZCqbClrFTsXcBPsOy7
         e2TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tv7WnAmniezz6T5OyQLCEzbM/tssytc77P7vfWeU2GVeh3UioT0IUTlASiMvlVeAE2akA1RCzIioU@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzYyiRdeY5kIeZ2XEYJyfbeu7xPWhkiK/EHwVP04KkSaYmd9Q
	uofiGhtgPTj1Ko05xiW6FUK7Bh5zLGtr8hkHdYga35eR6sOr4OnvXEh0mCs1LwoomwSNee4y2L5
	O239t+mc7OWKlrhs8+zAceO5g/TtBK0qe+7RP5LldAGD1CU3KcRKdCuI2fWkpsk1Y
X-Gm-Gg: Acq92OEkZkFuEGBbxKMrAbm7t8OHq9sXRlYTqqa45zs/SbvdW8db7BdispiV2crBv+m
	SkUlJ4yhaT1k+s/HQiv8B7Qq4+0uMRjWy2NdaMZ5lt+8blWz4Q2gHUdUhEuf/jhNoQYWfvylzaJ
	rXOlFKw01SwZbzyEFNvfT3qFQvL6YOAn7sWJPoBtQ3D95Ks+m8zfaU+TJpe1jN55pEKbZ4BJNwa
	We3wnOTnYsaryDFF2qoTVR/D3S3N8ZUtPnauykDxV5jR/QxS6R+a3R3eiUYW9Hy8mQynO0gEKSh
	ZI1JnVAElI+QVye0p90+h8X3afVqzth9KHEkOsyNGDgnK/1bciglylcOE7fveg0HNWQ5ImxytHi
	m0KRLLiplfzU3c2ZQdYUgZc6Gs/3MwYjcu4RrEoKH6teDFnQe8MyfLMfe4btZhnQuJbxpp61HAw
	BVQfU3BXvloUfsaZh9k0s1T65nrfHNmhtGlj4=
X-Received: by 2002:a05:622a:5514:b0:516:d83d:b28 with SMTP id d75a77b69052e-517fbcc5b67mr25698741cf.17.1781250874016;
        Fri, 12 Jun 2026 00:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5514:b0:516:d83d:b28 with SMTP id d75a77b69052e-517fbcc5b67mr25698621cf.17.1781250873624;
        Fri, 12 Jun 2026 00:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e171f94sm320088e87.37.2026.06.12.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:54:31 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and
 sleep clocks to DISPCC node
Message-ID: <tjfx4s3j4xbj3ddc2wk6rxatgbeurc7nh6vt2xlc3q5mmymfg5@bxwylu43bsux>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
 <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX3Y72iIREihxo
 8dOwdKmi5MNzOcpQ1S40aCWIlMrj0hPb0rBvYij/ZKlB5P7P7+PXDkvLkQXedt4EEgMDB7Gc7vP
 NG42njMJBgCwIdJ8DN2/VpEA7mqspw9SRWxt7kct806KH6PBQJJ9e6TWhbD60VIQLJAq9yLKNvq
 ygNLkGWzcFt8PJklLbtGGKHGYBnyOrnRR/GWzdeFTnSvkkrkvqv2qYZTX+4EZrwvMMB/vAl1gvW
 BOz41wAx5B7LDDTn4b9aJKu5R0fR9RmOKDxojJmkt4Jz3t+IZTdl+co2vBB6QVT1jYlufWfpP7X
 iJUGGcd6sxjU+BfT3J/BKecF0z1KQMqxJcRM3F+9Ca+zi2Fo34cPNTL3rv+XYaryFucbrmVFRYF
 GSqwrjoY3aSqzP5AU1JTgvPpVb0eX8x0WSchyY1AG58b2TiRsMco1Y4+4Ikt89gewBoo83kSRj6
 j8ZLfYsUFMNRdMSr7sQ==
X-Proofpoint-GUID: zU1Yfxv-IjGL--PlGwKCuwVrsuvOmd41
X-Proofpoint-ORIG-GUID: zU1Yfxv-IjGL--PlGwKCuwVrsuvOmd41
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bbb3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sf7wYq3a7C3g1Bpdey0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX/wztrizCPTNa
 hVvLEPvEiSVu2JPVaBNhmPzSi82zm1My5vb7ru8cHs8ZWizX9fp0oIklyRhI3aPUOecncS0ub8U
 vuC62juClyUPJn4QTQq5QakeMuV4BpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070

On Wed, Jun 10, 2026 at 04:02:02PM +0200, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
> > Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> > bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> 
> The Agatti MDSS doc suggests there's only a single DSI controller
> and PHY. There are registers to support a secondary PHY, but
> are those just leftovers?

Yes. 

-- 
With best wishes
Dmitry
