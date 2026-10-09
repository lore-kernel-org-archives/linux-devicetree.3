Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109C43C069
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552238; cv=none; b=i/R0ISnmytcN57J2rNPVDAdsK5inHTofYRAD4fV7b4ReWFqliGuMlaSJTPzG6pcPG5bdr1pm2ei5hARDfiaQF39XaI5rxIi04vOf1GhDp1LJ9C2ev06NV6VDyhWsUqnMTqHrQrAvxhiRZDIFg2pwAlTKvuiFr9WKnfjhG6gxDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552238; c=relaxed/simple;
	bh=RDoVcNfYx4gWnIuXkIiuuDySeKt6FSVcYGy5RTL4yVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUZSziWM2RwrciN6P1Fgq2Q8PKoHuuSh3yJjkoIAnes3crWpT9IgfCEXrXQui8qaDe0+vBchCD9p4eVBPfh5jiGIgzaplWIGrb2E1gBAQwKL5FSkoDdG2FILVZc+33jCzo1NL+xugJA/uJ4Zm6wF+gyC26rVk5ovq1pmYg/SbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAodCrab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hghnHY6a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAodCrab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hghnHY6a"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DLQSa444795
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTb/nAfNcf8kmDxbDKy+Ovtj
	nlCj5G5u+5gd5OlFFHo=; b=ZAodCrabe3fUrhjjoTHdRkIIE87+b2J+h/B6Geh1
	tmMSwvyuWk/IZnKg80VRBHtUP0RGB5IICsSGqhbUNxZCg3meVXqjUv/vyzAuSfen
	qRIwkQLhnCEbkulp70eSu36zEg4UXkthNNn+1HQHbRZirJuWG9zEDQYmXi05uZRW
	yp9125PWxK8dR5KwYaAXqCcdhXaTtZvBipdEdYsaXUNWa6tWu8Vd7b7u/hRS+/iC
	feKdKji/X+1y8JP2m4ZCPQyumYSvSbQYn+I5Pd7M3hPWX8/cQYUplxrgkj1hic1C
	K4lmOk2/oxUB59s7Z+iU/BH4MtqZwZW8eae8MNXySAwVSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5c35q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:23:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo1075599185a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552236; x=1792157036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=hghnHY6aU/io7XZYXfAwv/vwENUjMbD8HmBeMxvSPvo2HW+PP0/70j+1Sa/T5QsjVa
         Co+N0C+8q30GnnYEYQLfUbWI+tKuvGNb8xcLs2GI6V7LfjeKGaJrlL+mfPwDtXgy1+2U
         KvSoZrpHPlhb1vhkVwEasb1uG2b4AZa7CXYo/r7uwTMPpK+kJfyOovzvHVXd4gTCsN0N
         DeetdCuzej9wVTiP1Aqu52upy+OKM3Wn+b28D4OmWg2IJCZvPqz17aDluHrzkHxVmHo7
         YGTC2jZCigT4ZMCUE7j3jzVrifrDYb3iJXDl+nackGjzOZMKMQIJtB18l6xYaBx4c3iS
         euVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552236; x=1792157036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=hVGm+/VtjLUA3P6mc+bH1/AGqpTkfwuLi6ag3MN5zqKAK3apUBj73r9lb1H66aFlZa
         ZelzrzLnrDu9f77VddljdrVfNrjke3Ye2s59NF+viWFdoZ0V+K7ufocxGu7LHx8Snb+E
         w8f8k4LyW8gwCpQ58Z4+rKsF3eBxaviuQw5Bh7yzSxmDPlxoWWlVwxVwKORCsOv3BtjT
         TR0Pn4EMnGOfHMmZolIbn72R+WbFKhRWgzpazfVqiqxidj6Dd4N7k2+dwnqG6oJUqkn4
         B8MXgiPSQUQK8KalcY6CrpSSpXMK87emk4EjLNxZ3ShZ+M5S5y2JGiMFnrgYyeom0HfV
         Hmtg==
X-Forwarded-Encrypted: i=1; AKwUvBxJMi4Os3cdAprmHzcX7msy1uIAFNuKbPOdeavOJNV3N71ucSkIWoB3P+YT7sDEPaDgGFEhhEwSQClH@vger.kernel.org
X-Gm-Message-State: AFuF++nHj8wv4BW3olWc+923tTR7sN0uphBsdrah6I5VKO5K8twWFfOb
	qq1j1SUUeyjSCeHq2Cma7KVbBpOIJgSRl30bHvIVaRNhKMZKHRjuq50jqAdA98yOqosb+FiJof/
	I+Opx27FxQ09WLSwTLnffH53Rt0OrJS4SCsGADz9N/G1xx43x1QZbU0RxuiFSX0mt
X-Gm-Gg: AYBFou2skz2gPB7i9sxSJuX2+Wn6cewfRVB664dW666E4ltGeDgZRfiYWfjGTL45B3/
	bi+X0mdEkIAxwRb3qseQ7I1GfCajCAQJH3tZWKLb2p7sPOkTSJVQ3K3LXR8FParSxww/MiFe7CS
	9h4FMo4x/dwrKijbgoH2pLhmbZ0TX07IueNRPVXJnXc0JGuhszqnkmz958JqzM6slpNGc2FlS/O
	ZMr/HuIMU01s/XaOTX7XnD5kNo2QySJuDYWurztkWg/BsqxRNOSyHZMrAOpb5iNPhcNsKvKej4c
	aQhWiAkpeIdhBlqqdZN5ZnluvnXwm4dIs/4Ob66J9zjXxPxp3GWFKH9LjO6+s+zvQTQNFLCiCgB
	qPgwBmkggfitzo87nkI7XBXW/JH8XCUyTyYkD4+qAQuBz03zaYkxxx0+7yJl2TBkpuh3ctLik0P
	cPi8jpqg9CVE1+
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr253001885a.57.1791552235237;
        Fri, 09 Oct 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr252993785a.57.1791552234456;
        Fri, 09 Oct 2026 06:23:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81e6sm634124e87.46.2026.10.09.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:23:44 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
        Junhao Xie <bigfoot@radxa.com>, dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: document Radxa Dragon Q8B
Message-ID: <kzqftw7lugumzzkafcnsa36n6nix3kmwee66bzlv67aoqrkovc@7lbdhwfchvp3>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-3-eda11e5dea8b@radxa.com>
 <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX67Wd0KlZcFV3
 kZWDhgLPfsCgTvA1kqx+I5XS0MkWKzFhyOcNep+unpx7g+FqpjWRjc0RtJtlagv+ExfziaIaMK0
 hsDCsC9+/CwpGAzoYCfFvaFN9RCWOfQ=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8eaec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CDNH-pee2JQSj4idvpEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mKH23EsvjylkFOSZDcmm0YtiiMtokDxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX+zo2YdFBKPzz
 8lIXj1pns2yo5wV1ru/OqrCBZ8vJLYTal8/5dRdxa7Vo2g4gommkElmh4TtQ1G/CeEXsoP0c+7m
 RMkPBVAECb/6U1r40f7XyWJEbhgSUMK2A25SOnR2yCp51tHBs+trODx8wnPqA9crJcK5BwrTHuv
 Jbxe92NfV/weUdPfhE2JPd2nzwgZl/LGouvjmnxfn8/VQqcKI7Bx3w1gJ2H4kL3xkHJhnzJ3k6A
 KIELe5En3WDEBOxG/ceBJ1TTtoIeEJk5hgmhHqHwlREvZm8os9Oyz+ltuN6fn/XMPFtotOyENaj
 AL3Dn0LzvWe4Jwl0Dh9IN6WFZGcAnc4pbxHW7ENDPfvj19aEe5jvWoCx0Hrm3NM+Chrt0oDNfUY
 vPFZ4b5pUwkNbubDlvDSm3uRT0EejJH9ZCmASX6HTVj9HURaO5kqhUtdwUWy+HYuuC7HsRz97hJ
 5KJVI/ocogPUbLB80Nw==
X-Proofpoint-ORIG-GUID: mKH23EsvjylkFOSZDcmm0YtiiMtokDxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:42:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 09:55, Xilin Wu wrote:
> > The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> > SC8280XP platform.
> > 
> > Document its radxa,dragon-q8b compatible.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Daniele Briguglio <hello@superkali.me>
> 
> Fake test, drop tag.
> 
> Why is this so problem to provide the tag ONLY to the patches which were
>  actually tested?

Please teach b4 to skip to skip Tested-by on dt-bindings patches (or to
have a flag / config to achieve that). This would solve 80% of these
issues.

-- 
With best wishes
Dmitry
