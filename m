Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A53382E5
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721585; cv=none; b=ji2iICUN1OGiAukw4C6FSaBsegLx+FMe47WBunDYu+/lnUxHYgMnXnRcSpkZuxaqE89NPuGeezksgJDlSggkM9vl+IsItCriFrDRgst78olx8PvOWnK/BilR+F955T8NfLVKSqOfw/Y6mynBiRHLlBIJVf1pJCgv6vHJIG90DLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721585; c=relaxed/simple;
	bh=t+HvR0ppclsLjqzVD6bP78Xg/WRSbOLN3LWDgiVfpPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsYlyPOvq1QsEvTCPhTnMzvzhi/XZVIxlCuQeKhFWK2Z+AbFXSE9euTySsMvGuQI6kLK7xkgUHLuQLi94IIs+0pWkWvjlDSbamqoKGoJKGRNFCZaBfgrYiTiexLoeI7e/BmD+eggiVeCOOvwjmPUS1P8iybbxbdPdKZwNWo5DJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxmgTnqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULUATTQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxmgTnqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULUATTQZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HMVB3897669
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vSkYOFx9qKF9D43d6utTFHWm
	NSx4pj5kQixqWQhqj2E=; b=nxmgTnqONmGHM79l4c3IfiaDjbZ1pHx1FlQ54Saf
	urWRgG/Lnwv+4bDEMFqVwZ+Oajbbcr4UQaKLeO6ZA3Esm+5t55PJPUUCp/4/Jd7o
	3lUbcmvp5yW1esqZtWkqBJux289HAhR2UwpfwBc9oHXwu0s3cZdEvRQ4XWZVxrFe
	8ZsxyeNrL+QCJi0eEd5J8l/KtnOj8nNr1I5mpFsqcU8lKluMatXhkoe20bBAeEv2
	+FA4SjA+Mkn9u9Vr79Seq1g5zuEXMk50Y1XGQ05mUYm/EBJj5jPtNqB6UFblhB0v
	iUbxRsv0BIF+Oyo+H1/a1awAhYCqbKjfPEfp6qtd1XBpdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4msxm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso10691041cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721583; x=1788326383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vSkYOFx9qKF9D43d6utTFHWmNSx4pj5kQixqWQhqj2E=;
        b=ULUATTQZ45Oxghy6zLEnall57rqzHGajGKIRDw0GNANctASXaJ3QUEpvIQyZ3s0MF4
         J1Dy58dtZioZKVlqFZC1ZYNAr+WbArG6WkQSjvBuITzLuMXjmT07eJgybZjmiULLzCM1
         vdYA+0r1nrj6IE6EpA3L0H4QypjrNF5hYaSoUtsCYtz2iP2SQYC8/NylE+qf+ongKFiy
         /FdZIJ0EFlmVVoeB1wIZa204WfT3Jx4EYI0yIy70NShdO4rgQlGWMB7c10NdXU3vVw0g
         jFvcZ0v9pJn36JTKK5xXB8ydyMbIdA3xlgs9yA487KXLG1opPvhN09Fn7TUNXH60amdU
         ra+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721583; x=1788326383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSkYOFx9qKF9D43d6utTFHWmNSx4pj5kQixqWQhqj2E=;
        b=eLpljPkG69NUh5CX9WQZLaXP3wb/cX4gjKuIoRhNWll7/5+uNoSCTXhL7abfdoYOOW
         KFRretKWpQJu29h/DV/vmWyfHNjs71a9/wLNo360yEkykGPLjHJLCgNDDlK5SZ1f4SPs
         w7vPx2q0XYT90IqtktMv4FAhtPQqug31telH6Tbi8bolyCJGie+9k4mFyJW3gk+fURBQ
         MOFALq5ogiBYn9nI7cmbWM7LlZtWmhGN1DZme0LM57s2oRj1WY48/NJ1GAW2ct5QiJyT
         PEAPlYJz0McN8+bj3MtsbbJsO5cUUXfLDRZDwOuhe5kYtwtUoZM5sYaVlPBh5zx0fiiy
         TfVA==
X-Forwarded-Encrypted: i=1; AHgh+RpwN610GIMDZrMrCBqjrRw7eMbItmO51xGeL+wblOiYw2VNhprbIgGijJPVWZ10Ra1+kSCO38IJlZsJ@vger.kernel.org
X-Gm-Message-State: AFuF++nClAGRx0gyFpUuFCpK4Ct/UIdB1qwdA7kbicL8oa4Qd0inQUcn
	iAKXYI2H/5eA00WukIBjyPcauEY2hmAMsxkQVBQSZefSF7HM3U7zpeohgkbNcg1zzo+XTmGT8ME
	jnGW0T0MD1O2eU/2P6AHThxoQql/ur9PFcRkxLt1681vlmZ5fyZW7aiv9ck0PfS+I
X-Gm-Gg: AR+sD122EJur/s7Xlc0FQ+ajIclKBRdr7UC26ZAeeyGvvm/LRKYfg0rbx5Vpx4KsVJ8
	cLzwf/i9VKOs8OzAlcxlzbzKFuQq7sbcgqH+gq7X+V1h/kTyS9mZJatQsR24ydq5fhIS8eVsBKI
	Ps0TYISeZ/FvzY6vP3jjlmp8Xy3ZDZl/R0N/jq9ygspnNC78sTKwQqqU2EPvyDfEZGm2rfV1KZ+
	gCeMhG4CMZXlpn2Uifs/wml4heTYaD25XpYW/r0e9TcV9Anmz+bFnodMubNTPDFkHUJ2rggO45p
	5CZTBun6DgwBL4MQrLfbLutQDxxgL5nM7ZNUf2QAwv8Akk3PALFoxnmpSJBuDAcnXfEOSNvyxWW
	/HkFznt0rKhvboQ==
X-Received: by 2002:ac8:59cf:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-52e42320599mr39933911cf.22.1787721582829;
        Tue, 25 Aug 2026 22:19:42 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-52e42320599mr39933661cf.22.1787721582362;
        Tue, 25 Aug 2026 22:19:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68desm428450866b.10.2026.08.25.22.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:19:41 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:19:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: mahua-crd: Add PHY supplies
 for pcie3b_phy
Message-ID: <wufgybb2cmn7d4zp2bdgwx2bqoekefba2dxyksvkd7grhbe22l@tzaivdm6pnib>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-4-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-4-56ab597d77e4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX2sQgwKq+aGyz
 aHlEafLcvpyZ86WXFRGS8Kxt3HfOq54B1VENvBTUELsYGOlTp5es9YlUaOZxgk2GqpBfo9a0IgS
 7KtHy+MSpV9c2ic2BAgmt20JKLH8Q9c=
X-Proofpoint-ORIG-GUID: QCZpT66kx3yg1rvNo8plaHLDvf9wCPD4
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e776f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pZ6eNVg1DDkEi6vEKfoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX/Ncao9LFevjL
 /n988Sm6nUnnGmpsDYreL4ZST795COIiI3GUX/jfxoS+vq45Meg3WoqACgTHkoCuqfDSXivlz64
 kEKsauevq0sx7ZVku4SPKeFee0ag1ZjRKFkyyYfPGYBUDzvSQRnmz9EQ8HBe2udQmY3sP8bYi4w
 vETWN0cMBxvhYJveLSo9w0XNmwgvbYME+Oyo5FU1ttVhJGp/ef9fF9BnGHFRo7JU2HbaRgDZmil
 ZiRqvFQSOreaCUjOk1f248lZVpAVf8XTO6d5h4KvmApqVWDaDMklvjkggOTgua+1Wxiislxouvm
 CtUpBdE1955LR9XJihGnSF8ecZOqhASqilfLsvIZg5Ma3j5+5Us4Pd7+c1xXJfqXyevO0c9Pzao
 Q1+OjG4ZgTwusa5YRqFw5K07oLSGF3SqANxm4fRcPn8RAbl4uacevAVttFn4+JtMHksDJEPMpH4
 e6G+eL8j3lrd3mZ/JPw==
X-Proofpoint-GUID: QCZpT66kx3yg1rvNo8plaHLDvf9wCPD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260042

On 26-08-25 19:59:23, Qiang Yu wrote:
> Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
> &pcie3b_phy.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
