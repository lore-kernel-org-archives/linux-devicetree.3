Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFE41D641
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109724; cv=none; b=rdSTRf8GLyIf+7HKKlynOydc2PPC5uW8anpKUCLy8J50hxtOHyW3jwVJri5v00hu4G8YOCruV9EMLRzdpGKFT2Qe4Nne6+h7dleDFyIoqfpfZyhRS3hiOGzq75ob7fU1pXWQaIXNkSJEKI0OtXdj38d6c6pf6i+xNSH6C60og1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109724; c=relaxed/simple;
	bh=vakGs22BbcNPWIXA0rOWiz3UEs+upsXFnGyjZNiJ14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tttzoekCwKWyFrrxm5W+9MUsxFeZP4CQeU8LRIuAHecibIB50lRu2B0GIOmkDfktzh+vQS8/NDwt96nozFtCozvMIUMupSBZSDHHCZowqI50PSH/Mq1hoj8XG2zSRJn5LUFZphxMxUyLgxW15qAHbNBYl/ooKeP4mUR0nPLMhlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA0+H6g3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auBc2efq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA0+H6g3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auBc2efq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBh6c3897576
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=381iYosL+3itKnt5YRFUwV8J
	LY4LD2cyjBXKrHQ2ChI=; b=aA0+H6g3oXd2Sa6hy5rldT9oCLIck0OdeO2hMwWA
	+lOS64/elxIhA6SQVJ2g9onAMk1vq4NMRfVdYqwpdbWvUraWiccVFHulQApfZo7A
	e+akbRWkGnFucV1PBRoMRLpyMihQyGUkHArG4Ulu7sfq0FXmzrEPKzIN4kpRAFxS
	KDP+uwgKchVdocWU8boMFiJpRw1Gw0ORe2pHUsTVuhhXOvyP0R1QqF+upcJ9HBrw
	jJJfe2m25FchMK/Im8DCRNUUtTXliCCVzWlniL2dEY7ThpUPZXIeav9Oglc6rueC
	cfx/gCZvPyQxHHzN0GK29/ShUY4h0WhwqCEMwnf1o/t2qA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0f97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso56985785a.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109706; x=1790714506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=auBc2efqPM0HXKV23CLxk3ddObcdpwVg6OvjPdlAuMjQGBt4Q8hjPY5kxla4e5cpwL
         Qf/5f2hjUNAOcCxLA3vRniuBI1T5sAmt9Yb4TTieDtH8f9K/fNYw3qqN8upDyeRkwPZ0
         zHNN44QQ3MUFC8YA/zlw4hMIn3pHBkx7RefExWwlYJ31sAWc7r2s9ts0kFRlunlH6jdv
         AHu7ZS/gc24iJNs7cuHL/SjdGq4AR62BEIWMVzRjSEbh+CiR46FbEJqJGlY0G6sjozjq
         kkJfxg7QVG8E+OfL00dkjveGKEuSwIEMoChmWqLmXyxWlMYcbp6Rwdrf1aTyHU2DlGl3
         21Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109706; x=1790714506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=qiowptBmS2vgcW036GV0R0PajSLcS0GkcwlWO4z1QAWdr8yh2ION1mO0eTFGMdgLS5
         6sFNk0C0s0mykt1QUgUTAjYfNNnnEe9hjM+kSW6oGF6HqPumLzl3gty5KYpVmzFcIHtK
         3cuAzmS+Q8HDigPwUbHL/OjvkFELLF9BD9I3ndPzkFzcMyCnIbltx75lxXJ1yBWIrUAX
         P7kVnYFS8pubD3N09pmJjfGzYmW7rY/EF8fzFzDHbANxPmx/oVMZBAc/EIPNJ5lmJOnR
         8D0uvMCwqO/x1CoGfz/cqczD5EIi7hg7zWjUNaB26T3JmhTBgdW39f5Swa1HxyM02uGL
         4AxA==
X-Forwarded-Encrypted: i=1; AKwUvByUQLHVyTQEGRAqWLBHun1DkxwcAN7LmLw3qvTj1XPeyTsFz18HzErEyUeZ7kJwpsT5XvdAGhQ8KMoQ@vger.kernel.org
X-Gm-Message-State: AFuF++mWEdPOmMq0ZdgWNksiZFdLedh01VKKUQVN9cX6+NGv+FQH9gFt
	5G6QE+KtXOZykbC1wuoKHv0cnMMsuOo7JJLnSJaoE9oYgzr4OfKtx1qWFCGaZ49QmQPkutmdKEP
	ZdxGlbdWFKIB5CV5Ikg6suiY+xSEupmyUfUUAJQ1ouilMLM5JUjOB4SwUm3YNJG4T
X-Gm-Gg: AYBFou2mvKBowFXVh9O6x5DUfc5zIQ5qAphAVG2Aw55rMLu1Skkxpz15L57/8IFZlGv
	MYLIZ6Xm3s1Ortn3MABFcCA7NESqfhVaknA/QNOSpjsYCAHnN6ujMo2LymyxGYoGhq4oPft1fdr
	GFNCWpJu92pwh5pT0Eq7eLYn0u6V0gMzm2yLwvadqAk2G/sJMjxACvCjDVhNO6CBoqwsF5tFUHI
	jAbiJIOuOuzZMOPcRkQYUz9TA77iSnh1pXuIP+jrHuquKgUpIYX+hM0BJ0keDnDAD7oxyQn18z/
	IvDhlSZjkKPCd9MGYCMKldWywelH5SnNkIeTgK/XCAhUCVIJx5FM5IAhVHF6Clez5h1MXjFtGak
	sxt+LhGx4vm+g/l8=
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96674885a.2.1790109705616;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96669785a.2.1790109705035;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm1056265f8f.23.2026.09.22.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:41:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:41:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
Message-ID: <dadpw3tpjoitgsm7v7l2wt5jmzdpj2zxjxef2dknxijgn6scsi@cbkn7daetyzi>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oSOKXwht2ddLBLOrgo4bY2RpmBslCWZw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXxrKnEG9B1CAF
 wDiKb1FP/15HvL0P2hiU/Yjryvp2ld+4hyxuOvkRTNM8z2c7G7R5+JxRuF8q6lTvJAS5i2M9/9I
 yrAkaGExS+4l2rquN7jso0/6uJ7OKDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXxySA4TJRB09s
 46RFdVtRMC8qU69CAaxGBYu0DuJTiX0JWA/Lc8N8YjJs/4KOGjduWN3O7nL/Cm4cpRgLlN1KkyG
 v0D63gAlfkbAC71HP7mT4yyWbjf0z1O6ergljAwGUpK06lOuIYrGolGZvHEw0RZ+s0wZmcnVgcC
 nABJc//wWZUfFtQUlZU/h1NiwfBGjF1E30zkxSYuHbE7ezk+DbSNOHYogT7c5X1p1WPMhbK7Ctt
 NcmmdhSeBElWmsy0tcTm10cnANcRNfvYFiM02ie2srdc/gBgdSO5G89tQDhaRmJrG4elt3niIeP
 ZaKibW5cZJRzUvIT5QWOYxl2QF5M+DE2X1nALn5tqGh6iIuLBZCYRyRrrBRpg+BAsbu0w+DPMA+
 9vCjbug8OkI44GG0qMts2FqaYOoRRE+Ty7GGfoKQYwSOY4zBhT61oR58kTwADrUbl5PSK4M1Ncx
 HZhwwCjzBeZoaXND5nQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2e80a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oSOKXwht2ddLBLOrgo4bY2RpmBslCWZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:25, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
