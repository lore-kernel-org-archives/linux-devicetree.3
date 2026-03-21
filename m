Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63692375AA2
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076347; cv=none; b=HwHXJhNQ/vofK9pmG3RLyIKwAcPFDThNbXinjEvDANsFE47kWjGtTCgDsaRjUOJkhmIbKp7MH0WEm6g+smedlcTJO2u4V8t7QrGsFzCvI0DZlK80+JYDGBaDZQaYYt4jRwtpoWOpmVAwp4uDFWJ8KdHPKZYQfwsXEo8eNXdwD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076347; c=relaxed/simple;
	bh=IFD5pZ5z1CDvjhsF0xJ89+yf4zi1WdRjxgbYOUYYV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5ET4vnu43fzpmTewa6ccW7G90QDWv+Y2SfwUjtPNcF9BHhr4O2tW7Z7tWjX9c/LXSR8aso2P4ExN33FnBdiDSiQklCNSuR1D+nHOgWM9WoBZsb8O1eZhOZPsEyUL01i/p9hT5S1LijDBofgA/8mFL2gC6k3xDilcjW9BFuX0VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzj94rnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWrdmkte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzj94rnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWrdmkte"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4kix8278956
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2/fRxb5vN01Hzo0dKPOZXNb
	ZC1yFJ9Phjhw19wLEiY=; b=Zzj94rnTX2nafsy+2hgrszmQi9W8jTxbakeriQiD
	mIodMWz9Nmf9AHWSt0qmG5JWpGh2bnXbKR8V0x2o9ndGjVSKp90rQws4T0Zj6S0I
	Je8lCRmeBq8sK9X0hhfN2VCNq5a9J3/7puLWb+K6a3N+5cTILcMbOh/4b54/FN+a
	Yj33YhhqX87w8P2a4NbndP6DBRXMHOpM2EDht0wuVIAp1vF7G50fRVMhZarPfzg0
	CuQuCDtBczFTHlhdjy564m+PxvgKFsE/Auq3mlyJzIVqeWSI4YhuW4G+f7pAZiR8
	T/2PnZhPIamLn40qCbyR+gHCZLMPJx0z2bthgs2SGXx5pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r8bfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so94698611cf.2
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076344; x=1774681144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2/fRxb5vN01Hzo0dKPOZXNbZC1yFJ9Phjhw19wLEiY=;
        b=NWrdmkteM+g/GcVNP4TmhizdEO6KdPxOqNkLvlf7X+p1EQvglBlLPKrbXdgcGqMHs8
         mncliuSikW6aWyYwsk/tUIfraCCl4cxYk7yXGWZfQMwR5bkZ3xVQ7mkUSeJxB5MXFVW9
         5MgddMFic0vFWHq5/YHzWeRQidkPjQRegckWGAgxuGlDj/dcxHtP9ceeJAonpCE9wyHK
         kwb4hn9ms0mMnEcvJyUUFQJOkAMOUb+3rB/D9qeqJKDoc90mdW5Mt5S1T4JxegCGMhN7
         Leo8oyYkcvSv8sOuIqG6sj9Yh5hIagt2HPz1pv5MWUB992mZp7IvGCWeLdi6qNnS9Ob3
         Zgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076344; x=1774681144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2/fRxb5vN01Hzo0dKPOZXNbZC1yFJ9Phjhw19wLEiY=;
        b=IKsQsm9IvS2oZ6Al9yDgEhOoNxAw/FNqz9twMfFjY+o4hizC6eTg/nGtsuLMrrahUd
         O1C0NJb3mIY1nIG0hnDPhT3oZvOAlCjm3ACICXYrPNq3exOiHCdK4YG7bYhAsSbD3S8J
         YmTk95WDOqHJbjCTzH5UtlhybP3rvD3D5vyXn7T6bGoUFZIXs1x3ixDRvg3TBSFXxf+w
         ewC3KBz8gbcusnflBz2F9CtuOONq4txt0ngrHoxIX0z9sRI7wZ1NIPk352fe4+WyALs/
         +49nqemPReAlflZ6mcqTHeol8yH1Za869iTZARCO/ume2eaaXDgO7mmXzl5dDfZLeuRM
         hhTg==
X-Forwarded-Encrypted: i=1; AJvYcCUtOJpeAOTKX78deWgZJajDB6AmbTJYLl7zE3LXS2dxnUlg/jf7Md3gPOjxUfX4N7sOPgF13+vZlfoW@vger.kernel.org
X-Gm-Message-State: AOJu0Yybh7qIakByeiIUeZihVRlM1LDUdoYKdg7m3GbNnnUOkCwOoOPF
	R8v5S48unKc7sK3E1mOujL6v6Fwbckpvi0p+2pmK9eiL+em2UluXGk/Ffg4LDNfRagmwzziEVqM
	5YHjtT41DGiEVi1jNKM62AbhOmdcxRLrwiWvJiz5WJPgUL1Pc+/j1lRhc94POjFkU
X-Gm-Gg: ATEYQzz0goLHBEE2I7EpXVpoT7+pwnk7XiBTn3vxhjWSzXXnFwHAPQ912RiYL/anLPK
	C10NP398g7Q7pP9078YOBQgNQoY+R1YTB88tXtwea/Td4KAn8PpH7M73KmoWRPvF9c/1nyrJzms
	N5EgKzCqxFIpJgrHYhbsoenL5JDjS2VOcJ8xo5atZxHuwJO1uzBUu6i9i7kUXcyy++RSEb+VSWT
	j4v1EJnQDtNN5/zNaRy7TXrDLSgL9xIy+uDwt4PbDODVsHM1xZ35ovWMnCvp7Stqkrp+BLKWmcG
	kZiFVV90T+tWN/vQUvDB/pJnvi4m4blHqItX2VNoH6Gdm1CJILOLZiDVksB7O/x3p9iWsu2Q55r
	6srk6VDcsIZpTG87yTVd6dDlBB0BErxdQxpZ6UbBvVZ4DIvtk6dNe1jx5B24ABGr8KKCRStjJFh
	92uGy3PcFdwR31enx8FGvENDrE1RSqHz9Ifuk=
X-Received: by 2002:a05:622a:49:b0:501:3ccd:cb3e with SMTP id d75a77b69052e-50b375b8448mr89177131cf.66.1774076343692;
        Fri, 20 Mar 2026 23:59:03 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:501:3ccd:cb3e with SMTP id d75a77b69052e-50b375b8448mr89176961cf.66.1774076343238;
        Fri, 20 Mar 2026 23:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192ab9sm978951e87.4.2026.03.20.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:59:01 -0700 (PDT)
Date: Sat, 21 Mar 2026 08:59:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Lei Wang <quic_leiwan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
Message-ID: <x4scfqkta4vc3utd5fy4wbfltk2tlibbejsc2iohjvwe5lyaad@f7hcbxc2s4dv>
References: <20260320205933.992852-1-rrendec@redhat.com>
 <20260320205933.992852-2-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320205933.992852-2-rrendec@redhat.com>
X-Proofpoint-ORIG-GUID: cDgQkPX1Wye-CJVQLU7M1QsuWVe75o-Z
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69be41b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=sN-raam6ct1y1SKqkBUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfX9vpv+ZKNeODM
 6lcS26McO2t47/n64g+EStZb5Cc/Iz1KGvK0cZjmK4uSEoY/So45aAduYFKM08GjAsxvksj/TUj
 5Rx5Qgm3hc13rDNTo3xYY1VIwhuwB6lfx3UaQI77QScBF8aaM5zwQgxJ0rdn+hloNecrgN9PYaX
 ZMPxLM6NSMCqLpn3pRPnxIsClbMfhI42mi/8alvENInmjxTa3f1JTWXUv0diAwA4GT95JfzXUTL
 Fc03rOQI0LU66ldOSjxpvaEN6zSEjP+7Z1oNLBtWoC75mMG2P1q+W8xE0sLsS2RkuX2IsqBtuh6
 iFCjPPmQ9TtetntNDTgYxrUbilYW1IC+t5L3k+yXXww3T4OZSCyNK0yDh2H2qwkznXrfNGQhw4R
 apf5erwKUiB5UbxCtgrszrqQ1wifrlNvGceIiCQED/dWuK5lwC7enhOyj5RKcbsKe69uig28VpE
 PsD2IlkqPmbhYW43k9g==
X-Proofpoint-GUID: cDgQkPX1Wye-CJVQLU7M1QsuWVe75o-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210054

On Fri, Mar 20, 2026 at 04:59:32PM -0400, Radu Rendec wrote:
> From: Lei wang <quic_leiwan@quicinc.com>
> 
> Add unique ID for Qualcomm SA8650P SoC.
> 
> Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> Signed-off-by: Radu Rendec <rrendec@redhat.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
