Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842F3438BF
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343418; cv=none; b=Vociu0ZXHjb2ICsTApnEiLrLGZUpM9FArUkCXnGCyPnic+JlMu+cdSqUdKajig0TW8m3tTKHZi6FgZdG90mZ4TWUGFOuCs4mn0FwTXfoupqOtKc8R3+D9nwOZIbmF6QK4BsJ2/A9RuIXE5zlCoYsXd7u24VfgzC+J2Rx3JJA+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343418; c=relaxed/simple;
	bh=Ausy8/4gz8lUdqnofFDo6hUNOeuY6YmQ2FWO2tl7+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsvLwDH9ufNiMkG+XyxtzxJu4G8u/+g5LfpjwRiDQvtileDQDGqV1LejbFFidp3Crv+H6lngbtgpLYuFuXjOZgdGjZeTQxRnfpoHKQqWhjCJ2MIMhJ7QB0hIer+El+q3XwJ6wo5BWuaskKxoyJLhfJWwX9TT3n/tL6NkI406MPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOKk/AKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpKaZh73; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOKk/AKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpKaZh73"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6971HM8H2136122
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 03:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KA48W7VRQ3uJFaVC9VZEckxe
	CX/Ro12c18oCYgFj9fI=; b=AOKk/AKTQqwVwdqwJ4RHXf+UEx/9Grw0PuLX/Bh/
	fl7qmVTYUXmKbu/7NT7+v/CcdcMsB1xLUIf3kOnGjtU69HCbuajma6LhoYQstI7b
	+/StMXc+dK5ASKTn5EvU0nXazkyeC3FzioFavxTKdJ21ZkvOQ5ijNyEzWjLcLol9
	HzYY1UlnJP+B2uwJp6/oSPjKpqBQ9Q9uEjZDssBxyOxW/NbqGrT3pLSdtIrhcNjv
	4iprMdmBfYjVS7wyH9Bn573mYa8s4vDzrlvk1CbQpUtj1UeNEU9bTw2iH0lwRWZ6
	ojdvncwWq3r3pOx1FR7EIz+qe7rXf/SPy/yro6ssnwx9pQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c678csr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 03:23:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7148754eec.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791343414; x=1791948214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=SpKaZh73N5Mpr0hItZV1SRzZsD9wRh6Vn2oJv9iKhV8YrUry1lfB8ABGtvQ8bYCZuN
         otDRq7qTdbGhOnRUaP2d1rB7i0+vMcJwT01YJAKU2OHj5g4R/viuo0v4siwrGFVhBr1v
         IuJqNKrRpDBSrZTSsZtZkBWMUMkYFPe6QAFxjZAwPMIi1gR1HGBMKiZHz/TsEJJ7X4E9
         YZ3ZhdL5+klszwVcIV4qGDs9MAD1zhAP64KIVlHXyjWdjrqzlVh7LzJ96KHdC3GiC0Ti
         AK9skj5bGdtmYwxLuz1YX/Nkwm8q4ci1289OcnWyNuTUbc6kx+CQzP8nWO+QBRJgNGrk
         bA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343414; x=1791948214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=fxi6h5sHh8uAyIa+1987uyTT83mVA3+BCTU8OPCMn6TMFP3Xe84ZojXcd3mrqWKx9j
         1GwKFxx1Bo+t1eD/ECPImcASl4gk4eMjj9NWlRiOtHtkMNXuVCxKkZGQVsFxUwbk1UpR
         hwDXdg0r8Uxp9UWjxaZfNB0Aus59wP0LNl0eeTRzwDNVaL/Tk9Q7E+gl/JpdqdeKfiYu
         RC0NuNn9K0JEY9hQnsIHXLIv+BqfC3585NYZhtHl2NE2VkinNEEhLQsLufRj+HCTJiAX
         u9ZPWk+qbsogJM8pV/UOVt2e4UkTDb8DeImQBs++vZsqtzVyFCAXDktvSfJsGyE8qoKe
         Xuag==
X-Forwarded-Encrypted: i=1; AKwUvByieaI7czkOYg+Hd3yzC+kzAyZi2qoX0VW5rJ5Mt7lN0SD0xbmF4VIinc+wljitU/ur9qUcV0u1IAED@vger.kernel.org
X-Gm-Message-State: AFuF++lRmJvijkP0XmN7WxTdrV9iEbg+Cu+e3eI2cM0pa0d8YOi+nGec
	Lks0M27BVCNtBmR5c7QGGLUef7lYOrJYo4AjoVwyxGzd1/+cCFwJpxICXt+OFCYdqlkSoCgg/Lj
	zYN+AtT+7lpOe3tW9qXdOJJ551E3q2GgXrfVZWbJZhr3RfFI52PgzQfffQOVvfa3N
X-Gm-Gg: AYBFou2RBufsj5L4WHc/dowJ+evUgaBzHdm+bRJ/+Z0SuFo6SZC7sAXZjYplN1VKkxa
	pYZuI/8Jytds0k3rhwP76dIdmjlUtuJNJnT3bDj0YGzR0sDvewEU0pecsK7+bM10x2Hsr6JUnaO
	6H8qLw9dTGJGIANfGmjchGUAs8t1CnJhl9kipc1oHmCP116ZsuvaVKDI3A7JW5mVlf+onf70mzA
	1whV7YGUyhUKrrfkO5NTgrwcWDLMQ0pAwofxv4EtDEhL6PE00s+oyLUH2va6M5fPYKg4WemRF2a
	pdFV6WixvZX5R5VAdq1ASW+HX7qmIdmdgvfEeujUZ9XovO1QkMZ6NVz9n1rOE9k9MZBp6yR2WS2
	h8nSKROGpNkoK9n4Gn25ByhidcpR4zntXGVqnMPn6oA==
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822499eec.30.1791343413968;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822477eec.30.1791343413469;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515b03da93sm2702320eec.29.2026.10.06.20.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:23:32 -0700 (PDT)
Date: Wed, 7 Oct 2026 11:23:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <asW7Lay9i_hiuTcP@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
 <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfXwPh6F2WCgAvK
 AjXWL4hfNhGDHBwrkk2T/qImtpn1P1yNpW8VD4r375XUzHO1cNmLzhEwyJ7lcn5SDVujW1ufcxd
 x1f1b44GNjGZSSKCc9evXEZJLhYJmT4=
X-Proofpoint-ORIG-GUID: 791sRB0HSFomefA_FxCSLwI4Y8i2S6CS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfX3tZEJIWVMVuY
 iqfPSimY548XsLvmWkoWcOaRlRjhQoxXSp1fDA2bWESX2nCLKq7O+ty2aWjeP5zlXfLLDdJf51g
 hZJF0ac/tYLaygBkAJ4hE9lOyFOWp400stEnthLFjI/P0qmawZSQ6Dswkbf+ZSGZtdveObY52k4
 a8kTfXwVnUneYYywTh4AVBUD1aNiH1P3iQsL2bjKsusajtwv/ZVDh9tsvgcyNljdAYfgC2Lp1Kl
 /K/XrxqqYt+HwEmb+oYp3PUgBw84+A1zxjKl9GQemwDE4VHOjujATifSgQaztr0g2AizkAC7MFG
 3GfvaEXWDCcObz0n0RQ0QPRu+VlU6V96OWxZEFM7fF5F/vpySpbx+kz/xL1iVzsxEvzJrDw52+u
 RWfvel3WktnLaafac/ZU0DMCssXZcFPMUuDeG92DRa3drou1Espzyd9H3fSAme8aKvksXsyDz25
 O4JQboGaI+oP0iGeBzw==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5bb36 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=362RFuTrwy6jnSdmp1cA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 791sRB0HSFomefA_FxCSLwI4Y8i2S6CS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070012

On Fri, Oct 02, 2026 at 05:46:40PM +0100, Will Deacon wrote:
> On Wed, 02 Sep 2026 09:38:58 +0800, Shawn Guo wrote:
> > Add specific compatible string to document the GPU SMMU present on
> > Nord SoC, and constrain it to the single HLOS vote clock.
> > 
> > 
> 
> Applied to iommu (arm/smmu/bindings), thanks!
> 
> [1/1] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
>       https://git.kernel.org/iommu/c/e9da5ec4a1d6

Hi Will,

Could we get this into linux-next please?

Shawn
