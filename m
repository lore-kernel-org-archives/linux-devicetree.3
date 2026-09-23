Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ECE515990
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166737; cv=none; b=S0/plLJLfJuM7UAphFYcppJL+lxfdHr4CrAziiVHU1O3dZvQUqMoxxGV4TvrqpxCmZVBC4UuZexG82a578omPi4Uc8+mOJd6Io3iqBqgB1xrZirDQPm1cLZkGlrLOT77WNBXcFLs2NZ7xExkSJL0hh8/HoZEz8UgXnBcXc3pQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166737; c=relaxed/simple;
	bh=U1wE6PU+rh41Cle3iFBekqUZh/m5lY7C82C6RiMSsZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPqi9GBdc8ervCllskV98OMMENE2iatD1R3qD3Kty8sIDjZ1OBhISZtsoN8N7/LYRadkYolUpa2jCGoQoA5BPoPE+B+0URWRrWPAhiFK0HdKoxpvSZz53fFFrWowPdPlkKLMVCyvey7CwxgD+jvCCj6Kl71ij6+GKrMdHt4oqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcEO1tfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sc/P9d/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcEO1tfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc/P9d/4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBcorq3161409
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=; b=mcEO1tfb4QCYZ2VO
	LmUNxsFxNIJJPSLGbez6p2cOiktCBAu0cpl/qGE6ixQj0RaQO9dHPJjlEKT6zFTM
	4A5p/Ga6PoRTkNlcRf8VzJArzqTBdMxcT+5g3ORHu8vIaLUD132W5216d9kY0SQ2
	hrJPQdYkzlCOn7eZwtyRchj8aNxzU0LYSVRu16HDD6UfXByv1xmXepMGmHyLI0Ml
	bEwUvc+j1HoHQHMCakRlpZSS4LGCBoUUcwaKEBL7rAWgYo93j52B/U+Cd24SwZT2
	OVFRPrhh6zgNqjngRSw8hNdJ+Y2GH0GnLXLzJ2z+1b5UhExFVhr8vHnU2w5sh0pl
	6lIo8g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qttsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c665139c92so90765e0c.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166731; x=1790771531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=Sc/P9d/4R0zK5q0cVnCOo7BnedMkpf1FVR6lKNMNNwJNVfQx8n+ggYXr3jPQQRazMe
         rTqaRP3HAmdpyrXciTQYudw1NeWb6Dh9k1Lh9gaNdHLVHa0ZzOWcNVi7klB6qCop4Bas
         KKIACd6gnGYNGh9S57gLFHM6q5CZLSsSuSsfife6YnHDXCW5Wwaa52RDWHZTFH43VtA2
         f0V2dgr7vfjOWmWIjxBDBnBpCgULiBng1Gc+3JhdcUcLs1wQZ2iPfQX8hK4msj5afs/I
         e1X0cBI50fUU239Mzp332PFfkI7gnTsGLQtqo+uThcxK9IaUZIUmifmbIjrjf9WpJA4j
         gqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166731; x=1790771531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=VL07HQfpjSMd2JLs34b1blQTVUXiUkjOAQgTFcokxXXUz2eqQp5W6Gn3rXUHkhvPKF
         /WEYPoxP7lwb9frkBNOWUKlRKvtNGOliD8Pb31x7ITdcAk5sJ2ITMTSmkVqL75oa6Mv4
         E4Gxr8ChG/+L0bNl3wxA2T9NGNejUmdaw2eVixYGwOuG5sm8ERNcxQO6dC61EpdsUtIm
         x18zom1fKeVguCYLUx5wr6ETqBNKCFD5CzlXpB4Wxao/3x321v0PAlACscsSjH/BcyTg
         QpRQyGsog87mgteIWOaKd6oB9C60bQh7Gg7SFcmuQ0vfisnWKSIK6UUWmp47/0/2y4Wy
         5fhA==
X-Forwarded-Encrypted: i=1; AKwUvByOSFnwsU9mc1KvA1DMWFIsSQX5NCzA8llTf6bk3eKgrepqtDInwHE1gSOyoFKdl8AalJnsY1J5hb9K@vger.kernel.org
X-Gm-Message-State: AFuF++muAhhD8LkbQWYqtoE8TvF7rUSe3ljGq1sSka/CRN8hPcG/gDMT
	/Y7X8dFdx1gYDdszYl40JtNzCIz7/FCE+LytuMuTSLvi84G2Ylk00BQgw0vsk4KMNOH/yOcATmd
	t+LCpEEZB5VcVGh9WmjTlld86VZLlNMI3zwD5iINbvey1fTccSC3iIZF9yFIbtL6d
X-Gm-Gg: AYBFou0s7tJMklZNR6ikfxQ/iMwYhJmQhmvbiSbaO0KE1/7hRiPgLdg+8jrpKDwwCEJ
	G9dTcosXALL6bs1rCu6N519AKR+2cx090DoAUkrwyCqwu738wO9YfmhJmFMFTS6NtWUhi+CIBEm
	uq10DyK33F7XZ/NdR9rDu/hxgKtixkzrh45vn315XD1RCWlt8rxjL8yl21VdICKdTh7aQCn2l1n
	mFABPmw5p0kfOMu71FPtVC+oFWq6Jayn04e9OPtWq28UwfuePDy+QTlaxHyGD73GdYpt9voYfzr
	gOu5RzoEAA77PB/O28y7a4l/l9mSxtUBG7IOeK0UqxxfnLia5d3W1LkCllDStJUkKNXfTEQ2asC
	Ga3kF+3WRM1bzBiu7AXNU2Q==
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333060e0c.1.1790166730789;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333039e0c.1.1790166730415;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3896a53sm1485858a12.18.2026.09.23.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:32:09 -0700 (PDT)
Message-ID: <ca7cf05f-0aac-4603-a362-0bd4c3193b13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:32:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to list
 qcs8300 first
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3c6cb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jsnCtpYymfaPz7_p4TUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 7aHJ-jLr6F2EW0fg91xAWAkMHvm4cg5I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfXx2DAh9uX6YH0
 riDrWHcPA2Vl5WaiW8JMxsgha7Si1wGngWjv2oFQpkz2aCSfARU2PIlzQbZKs1qjDynFzRdQOMv
 dAcVrAoEvoU8HjlCbiYMnmceoc81T/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX2lmZYzoIsF1g
 wJWpWlKFSlwnDRSBghguWaYTAdChMlZ2hmyO0D4bUOChCodVjQ8iRwiReKEBGuZYKZutemXz0Y2
 Xu4P7FgpbEHOEvM9HHip2rSlDkdeOvhwpEYWW0st/kiaAwjT9BTZF+mTKSnfFeKfuMPD9GxFxG7
 EXzTTR2AIxnYzWG5+nz2r+ZYR2Ha5iU7nFlVgGqKtyI32saZECB5zvdR10DvW+voj2K+7vwa+Cv
 54szhwgG5BdivzsacLO3OU1jJl/xxqfMNZl45Z+fPU2OZDyoXksWdRscq5sfyL2X8s07RcHcCj8
 uZPQRNZfgrsx6RSa0EDZ6M1KdLbAeJXMFF4Lrs1GybcC4VN6MXCBXbC3LU9rNz5q+8sIb3ZM3xc
 IihrTv/8JETrMV51xWTlpzSNHNilKTDnM0MXJJIcPyph/5KUhAJwoRievET4gb7oZwRMUVqo1S7
 ot6ZxbJehaF5cMTWrqA==
X-Proofpoint-ORIG-GUID: 7aHJ-jLr6F2EW0fg91xAWAkMHvm4cg5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
> The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
> compatible, since no QCS8300-specific compatible was documented for this
> PHY at the time.
> 
> Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
> with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
> order used by the pcie0_ep and pcie1_ep nodes.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
